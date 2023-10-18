//
//  MBLearnabilityViewModel.swift
//  BugHub
//
//  Created by Danila on 07.10.2023.
//

import Foundation

/// Реализация view model для приложения "Копилка" с нарушениями в обучаемости
final class MBLearnabilityViewModel: MBDefaultViewModel {
    
    private let errorTitle = Localization.SampleApp.MoneyBox.error
    
    // MARK: - MBDefaultViewModel
    
    override func topUp(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        guard super.topUp(sum: sum, date: date) != nil else { return nil }
        return ValidationErrorViewModel(title: errorTitle, message: nil)
    }
    
    override func withdraw(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        guard super.withdraw(sum: sum, date: date) != nil else { return nil }
        return ValidationErrorViewModel(title: errorTitle, message: nil)
    }
}
