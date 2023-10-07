//
//  MBInteroperabilityViewModel.swift
//  LowQualityApp
//
//  Created by Danila on 07.10.2023.
//

import Foundation

/// Реализация view model для приложения "Копилка" с нарушениями в функциональной совместимости
final class MBInteroperabilityViewModel: MBDefaultViewModel {
    
    // MARK: - MBDefaultViewModel
    
    override var history: [MBTransactionViewModel] {
        initialHistory
    }
    
    private var initialHistory: [MBTransactionViewModel] = []
    
    /// Инициализатор реализация view model для приложения "Копилка" с нарушениями в функциональной совместимости
    /// - Parameters:
    ///  - model: модель
    override init(model: MBModel) {
        super.init(model: model)
        initialHistory = super.history
    }
}
