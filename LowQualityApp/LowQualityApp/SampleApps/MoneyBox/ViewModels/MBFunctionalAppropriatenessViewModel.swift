//
//  MBFunctionalAppropriatenessViewModel.swift
//  LowQualityApp
//
//  Created by Danila on 09.09.2023.
//

import Foundation

/// Реализация view model для приложения "Копилка" с проблемой в функциональной уместности
final class MBFunctionalAppropriatenessViewModel: MBDefaultViewModel {
    
    override var sum: String {
        moneyFormatter.string(for: model.sum * (exchangeRate ?? 7.336607)) ?? ""
    }
    
    override var loading: Bool {
        get { _loading }
        set { _loading = newValue }
    }
    
    @Published private var _loading: Bool = true
    
    private let moneyFormatter = {
        let formatter = NumberFormatters.MoneyOutput()
        formatter.currencyCode = "CNY"
        formatter.currencySymbol = "¥"
        return formatter
    }()
    
    private let model: MBModel
    private let repository: MBExchangeRatesRepository
    private var exchangeRate: Decimal?
    
    /// Инициализатор реализация view model для приложения "Копилка" с проблемой в функциональной уместности
    /// - Parameters:
    ///  - model: модель
    ///  - repository: репозиторий
    init(
        model: MBModel,
        repository: MBExchangeRatesRepository
    ) {
        self.model = model
        self.repository = repository
        
        super.init(model: model)
        
        loadData()
    }
    
    private func loadData() {
        Task { @MainActor in
            loading = true
            self.exchangeRate = try? await repository.usdToCny
            loading = false
        }
    }
}
