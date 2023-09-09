//
//  MBViewModel.swift
//  LowQualityApp
//
//  Created by Danila on 03.09.2023.
//

import Foundation

/// View model для приложения "Копилка"
protocol MBViewModel: ObservableObject {
    /// Сумма на счёте
    var sum: String { get }
    /// История
    var history: [MBTransactionViewModel] { get }
    /// Сигнализирует о загрузке данных
    var loading: Bool { get }
    /// Функционал без изъятия
    var withoutWithdraw: Bool { get }
    /// Задержка отклика при нажатии на кнопки действий
    var actionResponseDelay: Duration? { get }
    /// Пополнить
    /// - Parameters:
    ///  - sum: сумма пополнения
    ///  - date: дата пополнения
    /// - Returns ошибка пополнения
    @MainActor
    func topUp(sum: Decimal, date: Date) -> ValidationErrorViewModel?
    /// Изъять
    /// - Parameters:
    ///  - sum: сумма изъятия
    ///  - date: дата изъятия
    /// - Returns ошибка изъятия
    @MainActor
    func withdraw(sum: Decimal, date: Date) -> ValidationErrorViewModel?
}

/// View model транзакций для приложения "Копилка"
struct MBTransactionViewModel: Identifiable {
    /// Индетификатор
    let id: String
    /// Тип транзакции
    let type: String
    /// Дата
    let date: String
    /// Сумма
    let sum: String
}

/// View model ошибки валидации
struct ValidationErrorViewModel {
    /// Заголовок
    let title: String
    /// Описание
    let message: String
}
