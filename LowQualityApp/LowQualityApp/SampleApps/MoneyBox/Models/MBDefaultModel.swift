//
//  MBDefaultModel.swift
//  LowQualityApp
//
//  Created by Danila on 06.09.2023.
//

import Foundation

/// Дефолтная (полностью рабочая) модель для приложения "Копилка"
class MBDefaultModel: MBModel {
    
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
    
    func topUp(sum: Decimal, date: Date) -> MBTopUpError? {
        if let error = validateTopUp(sum: sum) { return error  }
        history.append(.init(type: .topUp, date: date, sum: sum))
        return nil
    }
    
    func withdraw(sum: Decimal, date: Date) -> MBWithdrawError? {
        if let error = validateWithdraw(sum: sum) { return error  }
        history.append(.init(type: .withdraw, date: date, sum: sum))
        return nil
    }
    
    private func validateTopUp(sum: Decimal) -> MBTopUpError? {
        switch sum {
        case ...0:
            return .lessOrEqualZero
        default:
            return nil
        }
    }
    
    private func validateWithdraw(sum: Decimal) -> MBWithdrawError? {
        switch sum {
        case ...0:
            return .lessOrEqualZero
        case 0...self.sum:
            return nil
        default:
            return .moreThenTotalSum
        }
    }
}
