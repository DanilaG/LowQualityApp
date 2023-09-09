//
//  MBFunctionalCorrectnessModel.swift
//  LowQualityApp
//
//  Created by Danila on 09.09.2023.
//

import Foundation

/// Модель для приложения "Копилка" с нарушениями в функциональной корректности
final class MBFunctionalCorrectnessModel: MBModelWithData {
    override var sum: Decimal {
        let rightSum = super.sum
        return (rightSum * rightSum * 0.75) / rightSum
    }
}
