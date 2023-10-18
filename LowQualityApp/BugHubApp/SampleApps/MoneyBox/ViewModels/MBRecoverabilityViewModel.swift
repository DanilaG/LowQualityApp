//
//  MBRecoverabilityViewModel.swift
//  BugHub
//
//  Created by Danila on 14.10.2023.
//

import Foundation

/// Реализация view model для приложения "Копилка" с нарушениями в востанавливаемости
final class MBRecoverabilityViewModel: MBDefaultViewModel {
        
    // MARK: - MBDefaultViewModel
    
    override func topUp(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        let result = super.topUp(sum: sum, date: date)
        onFatalError?()
        return result
    }
    
    override func withdraw(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        let result = super.withdraw(sum: sum, date: date)
        onFatalError?()
        return result
    }
}
