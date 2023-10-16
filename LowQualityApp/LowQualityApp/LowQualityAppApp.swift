//
//  LowQualityAppApp.swift
//  LowQualityApp
//
//  Created by Danila on 13.08.2023.
//

import SwiftUI
import YandexMobileMetrica

@main
struct LowQualityAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainScreenView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        setUpYandexMetrica()
        return true
    }
    
    private func setUpYandexMetrica() {
        guard let filePath = Bundle.main.path(forResource: "YMetricaInfo", ofType: "plist") else {
            print("❌ Couldn't find file YMetricaInfo.plist.")
            return
        }

        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            print("❌ Couldn't find key 'API_KEY' in YMetricaInfo.plist.")
            return
        }

        guard let configuration = YMMYandexMetricaConfiguration(apiKey: value) else {
            print("❌ No Yandex metrica configuration")
            return
        }

        configuration.logs = false
        configuration.crashReporting = true
        configuration.locationTracking = false

        YMMYandexMetrica.activate(with: configuration)
    }
}
