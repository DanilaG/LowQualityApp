//
//  MBModel.swift
//  LowQualityApp
//
//  Created by Danila on 03.09.2023.
//

import SwiftUI

/// Модель для приложения "Копилка"
protocol MBModel {
    /// Баланс
    var sum: Decimal { get }
    /// История
    var history: [MBTransaction] { get }
    /// Пополнить
    /// - Parameters:
    ///  - sum: сумма пополнения
    ///  - date: дата пополнения
    /// - Returns ошибка пополнения
    func topUp(sum: Decimal, date: Date) -> MBTopUpError?
    /// Изъять
    /// - Parameters:
    ///  - sum: сумма изъятия
    ///  - date: дата изъятия
    /// - Returns ошибка изъятия
    func withdraw(sum: Decimal, date: Date) -> MBWithdrawError?
}

/// Транзакция
struct MBTransaction {
    /// Тип транзакции
    enum `Type` {
        /// Пополнение
        case topUp
        /// Изъятие
        case withdraw
    }
    
    /// Тип транзакции
    let type: `Type`
    /// Дата
    let date: Date
    /// Сумма
    let sum: Decimal
}

/// Ошибки пополнения
enum MBTopUpError {
    /// Сумма меньше или равна 0
    case lessOrEqualZero
}

/// Ошибки изъятия
enum MBWithdrawError {
    /// Сумма меньше или равна 0
    case lessOrEqualZero
    /// Больше чем вся сумма
    case moreThenTotalSum
}
