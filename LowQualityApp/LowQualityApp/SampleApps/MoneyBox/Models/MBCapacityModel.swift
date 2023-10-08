//
//  MBCapacityModel.swift
//  LowQualityApp
//
//  Created by Danila on 02.10.2023.
//

import Foundation

/// Модель для приложения "Копилка" с нарушениями в ёмкости
final class MBCapacityModel: MBDefaultModel {
    /// Инициализатор модели  для приложения "Копилка" с нарушениями в ёмкости
    override init() {
        super.init()
        
        let initialTime = 925128000
        for i in 0...300 {
            if i % 2 == 0 {
                _ = topUp(
                    sum: Decimal(2000 + i * 1),
                    date: Date(timeIntervalSince1970: TimeInterval(initialTime + i * 1_000_000))
                )
            } else {
                _ = withdraw(
                    sum: Decimal(1000 + i * 1),
                    date: Date(timeIntervalSince1970: TimeInterval(initialTime + i * 1_000_000))
                )
            }
        }
    }
}
