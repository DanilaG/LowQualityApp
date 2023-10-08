//
//  MBOperabilityViewModel.swift
//  LowQualityApp
//
//  Created by Danila on 07.10.2023.
//

import Foundation

/// Реализация view model для приложения "Копилка" с нарушениями в операбельности
final class MBOperabilityViewModel: MBDefaultViewModel {
    
    // MARK: - MBDefaultViewModel
    
    override var openKeyboard: Bool { false }
    override var slimButtons: Bool { true }
}

