//
//  MBViewModel.swift
//  BugHub
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
    /// True если не использовать преиспользование ячеек
    var withoutCells: Bool { get }
    /// True если нужно смешение в отступах от клавиатуры
    var withKeyboardSafeAreaOffset: Bool { get }
    /// True если нужны открывать клавиатуру автоматически
    var openKeyboard: Bool { get }
    /// True если нужны уменьшенные кнопки
    var slimButtons: Bool { get }
    /// True если блокировать действия пополнения/изъятия
    var blockActions: Bool { get }
    /// Стиль истории операций
    var historyStyle: MBViewModelHistoryStyle { get }
    /// Callback вызываемый в случае фатальной ошибке
    var onFatalError: (() -> Void)? { get set }
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
    /// Тип транзакции
    enum `Type` {
        /// Пополнение
        case topUp
        /// Изъятие
        case withdraw
    }
    
    /// Индетификатор
    let id: String
    /// Тип транзакции
    let type: `Type`
    /// Дата
    let date: String
    /// Сумма
    let sum: String
}

/// View model ошибки валидации
typealias ValidationErrorViewModel = ErrorViewModel

/// View model ошибки
struct ErrorViewModel {
    /// Заголовок
    let title: String
    /// Описание
    let message: String?
}

/// Стиль истории операций
enum MBViewModelHistoryStyle {
    /// Обычный
    case `default`
    /// Уродливый
    case ugly
    /// Нечитаемый
    case noAccessible
}
