//
//  MBRecoverabilityModel.swift
//  LowQualityApp
//
//  Created by Danila on 14.10.2023.
//

import Foundation

/// Модель для приложения "Копилка" с нарушениями в востанавливаемости
final class MBRecoverabilityModel: MBModel {
    
    var sum: Decimal {
        history.reduce(0, {
            switch $1.type {
            case .topUp:
                return $0 + $1.sum
            case .withdraw:
                return $0 - $1.sum
            }
        })
    }
    
    private(set) var history: [MBTransaction] = []
    
    /// Инициализатор модели для приложения "Копилка" с нарушениями в востанавливаемости
    init() {
        if MBRecoverabilityModel.isMadeAction() {
            self.history = []
        } else {
            self.history = MBModelWithData().history
        }
        MBRecoverabilityModel.cleanStorage()
    }
    
    func topUp(sum: Decimal, date: Date) -> MBTopUpError? {
        MBRecoverabilityModel.makeAction()
        history.append(.init(type: .topUp, date: date, sum: sum))
        return nil
    }
    
    func withdraw(sum: Decimal, date: Date) -> MBWithdrawError? {
        MBRecoverabilityModel.makeAction()
        history.append(.init(type: .withdraw, date: date, sum: sum))
        return nil
    }
}

// MARK: - Сохранение состояний

private extension MBRecoverabilityModel {
    
    enum Keys {
        static let madeAction = "madeAction.MB"
    }
    
    static func isMadeAction() -> Bool {
        UserDefaults.standard.bool(forKey: Keys.madeAction)
    }
    
    static func makeAction() {
        UserDefaults.standard.setValue(true, forKey: Keys.madeAction)
    }
    
    static func cleanStorage() {
        UserDefaults.standard.removeObject(forKey: Keys.madeAction)
    }
}
