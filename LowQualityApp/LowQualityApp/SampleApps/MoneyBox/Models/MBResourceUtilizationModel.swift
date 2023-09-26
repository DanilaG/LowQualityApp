//
//  MBResourceUtilizationModel.swift
//  LowQualityApp
//
//  Created by Danila on 10.09.2023.
//

import SwiftUI
import MetalPerformanceShaders
import CoreLocation

/// Модель для приложения "Копилка" с нарушениями в потребляемости ресурсов
final class MBResourceUtilizationModel: MBModelWithData {
    
    private let locationManager = CLLocationManager()
    private var uselessTasks = [Task<Void, Never>]()
    
    /// Инициализатор модели для приложения "Копилка" с нарушениями в потребляемости ресурсов
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        
        startUselessTasks()
    }
    
    deinit {
        for task in uselessTasks {
            task.cancel()
        }
    }
    
    private func startUselessTasks() {
        for _ in 0..<100 {
            uselessTasks.append(makeUselessTask1())
            uselessTasks.append(makeUselessTask2())
            uselessTasks.append(makeUselessTask3())
        }
    }
    
    private func makeUselessTask1() -> Task<Void, Never> {
        Task.detached(priority: .high) {
            var data = [Array(repeating: 1.2345, count: 10_000_000)]
            while !Task.isCancelled {
                let last = data.last ?? Array(repeating: 1.2345, count: 1_000_000)
                data.append([])
                for i in 0..<last.count {
                    var a = last[i]
                    if a == 0 || a == 1.0 || a.isInfinite { a = Double.random(in: 0...1000) }
                    a = pow(a, Double.random(in: 0.1...2))
                    data[data.count - 1].append(a)
                }
                data[data.count - 1].reverse()
                if data.count > 3 {
                    data.removeFirst()
                }
            }
        }
    }
    
    private func makeUselessTask2() -> Task<Void, Never>  {
        Task {
            while !Task.isCancelled {
                do {
                    guard let url = URL(string: "https://api.test.host/") else {
                        throw UrlCreateError()
                    }
                    var urlRequest = URLRequest(url: url)
                    urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
                    let (data, _) = try await URLSession.shared.data(for: urlRequest)
                    guard let cny = try JSONDecoder().decode(MBExchangeRatesDto.self, from: data).rates.CNY else {
                        throw DateCompletenessError()
                    }
                    print(cny)
                } catch {
                    continue
                }
            }
        }
    }
    
    private func makeUselessTask3() -> Task<Void, Never>  {
        Task {
            while !Task.isCancelled {
                guard
                    let device = MTLCreateSystemDefaultDevice(),
                    let commandQueue = device.makeCommandQueue(),
                    let commandBuffer = commandQueue.makeCommandBuffer()
                else {
                    continue
                }
                
                let n = 300
                let m = 200
                
                var aEntries: [Float32] = []
                var bEntries: [Float32] = []
                
                for _ in 0..<n * m {
                    aEntries.append(Float32.random(in: 0...2))
                    bEntries.append(Float32.random(in: 0...2))
                }
                
                let mmKernel = MPSMatrixMultiplication(
                    device: device,
                    transposeLeft: false,
                    transposeRight: false,
                    resultRows: n,
                    resultColumns: n,
                    interiorColumns: m,
                    alpha: 1.0,
                    beta: 0.0
                )
                
                let aTotalBytes = MemoryLayout<Float32>.stride * aEntries.count
                guard let aBuffer = device.makeBuffer(bytes: aEntries, length: aTotalBytes) else {
                    continue
                }
                let aDescription = MPSMatrixDescriptor(rows: n, columns: m, rowBytes: aTotalBytes / n, dataType: .float32)
                let a = MPSMatrix(buffer: aBuffer, descriptor: aDescription)
                
                let bTotalBytes = MemoryLayout<Float32>.stride * bEntries.count
                guard let bBuffer = device.makeBuffer(bytes: bEntries, length: bTotalBytes) else {
                    continue
                }
                let bDescription = MPSMatrixDescriptor(rows: m, columns: n, rowBytes: bTotalBytes / m, dataType: .float32)
                let b = MPSMatrix(buffer: bBuffer, descriptor: bDescription)
                
                let cTotalBytes = MemoryLayout<Float32>.stride * a.rows * b.columns
                guard let cBuffer = device.makeBuffer(length: cTotalBytes, options: .cpuCacheModeWriteCombined) else {
                    continue
                }
                let cDescription = MPSMatrixDescriptor(rows: a.rows, columns: b.columns, rowBytes: cTotalBytes / a.rows, dataType: .float32)
                let c = MPSMatrix(buffer: cBuffer, descriptor: cDescription)
                
                
                mmKernel.encode(
                    commandBuffer: commandBuffer,
                    leftMatrix: a,
                    rightMatrix: b,
                    resultMatrix: c
                )
                
                commandBuffer.commit()
                commandBuffer.waitUntilCompleted()
            }
        }
    }
}

extension MBResourceUtilizationModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}
