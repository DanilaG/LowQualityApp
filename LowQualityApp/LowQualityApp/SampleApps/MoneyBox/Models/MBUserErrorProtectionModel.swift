//
//  MBUserErrorProtectionModel.swift
//  LowQualityApp
//
//  Created by Danila on 08.10.2023.
//

import Foundation

/// Модель для приложения "Копилка" с нарушениями в защите пользователя от ошибок
final class MBUserErrorProtectionModel: MBModel {
    
    var sum: Decimal {
        MBDefaultModel.sum(for: history)
    }
    
    private(set) var history: [MBTransaction] = []
    
    init() {
        self.history = MBModelWithData().history
    }
    
    func topUp(sum: Decimal, date: Date) -> MBTopUpError? {
        history.append(.init(type: .topUp, date: date, sum: sum))
        return nil
    }
    
    func withdraw(sum: Decimal, date: Date) -> MBWithdrawError? {
        history.append(.init(type: .withdraw, date: date, sum: sum))
        return nil
    }
}
