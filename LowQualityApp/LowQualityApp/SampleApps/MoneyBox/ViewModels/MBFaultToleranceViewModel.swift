//
//  MBFaultToleranceViewModel.swift
//  LowQualityApp
//
//  Created by Danila on 14.10.2023.
//

import Foundation

/// Реализация view model для приложения "Копилка" с нарушениями в отказоустойчивость
final class MBFaultToleranceViewModel: MBDefaultViewModel {

    // MARK: - MBDefaultViewModel
    
    override func topUp(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        if super.topUp(sum: sum, date: date) != nil {
            onFatalError?()
        }
        return nil
    }
    
    override func withdraw(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        if super.withdraw(sum: sum, date: date) != nil {
            onFatalError?()
        }
        return nil
    }
}
