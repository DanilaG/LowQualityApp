//
//  MBMaturityViewModel.swift
//  BugHub
//
//  Created by Danila on 12.10.2023.
//

import Foundation

/// Реализация view model для приложения "Копилка" с нарушениями в зрелости
final class MBMaturityViewModel: MBDefaultViewModel {
    
    private var attemptsUntilFailure = 3
    
    // MARK: - MBDefaultViewModel
    
    override func topUp(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        failureIfNeeded()
        return super.topUp(sum: sum, date: date)
    }
    
    override func withdraw(sum: Decimal, date: Date) -> ValidationErrorViewModel? {
        failureIfNeeded()
        return super.withdraw(sum: sum, date: date)
    }
    
    private func failureIfNeeded() {
        attemptsUntilFailure -= 1
        switch attemptsUntilFailure {
        case 1:
            guard Bool.random() else { return }
            onFatalError?()
        case 0:
            onFatalError?()
        default:
            break
        }
    }
}
