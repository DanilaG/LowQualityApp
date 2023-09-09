//
//  MBTimeBehaviourViewModel.swift
//  LowQualityApp
//
//  Created by Danila on 09.09.2023.
//

import Foundation

/// Реализация view model для приложения "Копилка" с проблемой в производительности
final class MBTimeBehaviourViewModel: MBDefaultViewModel {
    
    override var loading: Bool {
        get { _loading }
        set { _loading = newValue }
    }
    
    override var actionResponseDelay: Duration? {
        .milliseconds(Int.random(in: 500...3000))
    }
    
    @Published private var _loading: Bool = true
    
    /// Инициализатор реализация view model для приложения "Копилка" с проблемой в производительности
    /// - Parameter model: модель
    override init(model: MBModel) {
        super.init(model: model)
        loadData()
    }
    
    private func loadData() {
        Task { @MainActor in
            loading = true
            try? await Task.sleep(for: .seconds(Int.random(in: 5...10)))
            loading = false
        }
    }
}
