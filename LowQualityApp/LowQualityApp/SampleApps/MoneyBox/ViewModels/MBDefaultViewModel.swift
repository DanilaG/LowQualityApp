//
//  MBDefaultViewModel.swift
//  LowQualityApp
//
//  Created by Danila on 06.09.2023.
//

import Foundation

/// Дефолтная реализация view model для приложения "Копилка"
class MBDefaultViewModel: MBViewModel {
    
    var sum: String {
        moneyFormatter.string(for: model.sum) ?? ""
    }
    
    var history: [MBTransactionViewModel] {
        model.history
            .sorted(by: { $0.date > $1.date })
            .map {
                MBTransactionViewModel(
                    id: ISO8601DateFormatter().string(from: $0.date),
                    type: $0.type.asString,
                    date: dateFormatter.string(from: $0.date),
                    sum: moneyFormatter.string(for: $0.sum) ?? ""
                )
            }
    }
    
    var loading: Bool { false }
    var withoutWithdraw: Bool { false }
    var withoutCells: Bool { false }
    var actionResponseDelay: Duration? { nil }
    var withKeyboardSafeAreaOffset: Bool { false }
    var openKeyboard: Bool { true }
    var slimButtons: Bool { false }
    var uglyHistory: Bool { false }
    
    private let moneyFormatter = {
        let formatter = NumberFormatters.MoneyOutput()
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        return formatter
    }()
    
    private let dateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale.current
        return formatter
    }()
    
    private let model: MBModel
    
    /// Инициализатор дефолтной реализация view model для приложения "Копилка"
    /// - Parameters:
    ///  - model: модель
    init(model: MBModel) {
        self.model = model
    }
    
    func topUp(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        defer { objectWillChange.send() }
        return model.topUp(sum: sum, date: date)?.asValidationError
    }
    
    func withdraw(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        defer { objectWillChange.send() }
        return model.withdraw(sum: sum, date: date)?.asValidationError
    }
}

// MARK: - MBDefaultViewModel + StringToDecimalError

extension MBDefaultViewModel {
    /// Ошибка преобразования данных
    struct StringToDecimalError: LocalizedError {
        var errorDescription: String? = Localization.SampleApp.MoneyBox.Error.stringToDecimal
    }
}

// MARK: - MBTopUpError + asValidationError

extension MBTopUpError {
    private typealias Strings = Localization.SampleApp.MoneyBox.Error
    
    /// Представление в виде ошибки валидации
    var asValidationError: ValidationErrorViewModel {
        switch self {
        case .lessOrEqualZero:
            return .init(title: Strings.invalidAmount, message: Strings.TopUp.lessOrEqualZero)
        }
    }
}

// MARK: - MBWithdrawError + LocalizedError

extension MBWithdrawError: LocalizedError {
    private typealias Strings = Localization.SampleApp.MoneyBox.Error
    
    /// Представление в виде ошибки валидации
    var asValidationError: ValidationErrorViewModel {
        switch self {
        case .lessOrEqualZero:
            return .init(title: Strings.invalidAmount, message: Strings.Withdraw.lessOrEqualZero)
        case .moreThenTotalSum:
            return .init(title: Strings.invalidAmount, message: Strings.Withdraw.moreThenTotalSum)
        }
    }
}

// MARK: - MBTransaction.`Type` + asString

fileprivate extension MBTransaction.`Type` {
    /// Представление типа в строке
    var asString: String {
        switch self {
        case .topUp:
            return Localization.SampleApp.MoneyBox.TopUp.title
        case .withdraw:
            return Localization.SampleApp.MoneyBox.Withdraw.title
        }
    }
}
