//
//  MBUserInterfaceAestheticsViewModel.swift
//  BugHub
//
//  Created by Danila on 08.10.2023.
//

import Foundation

/// Реализация view model для приложения "Копилка" с нарушениями в эстетичности
final class MBUserInterfaceAestheticsViewModel: MBDefaultViewModel {
    
    // MARK: - MBDefaultViewModel
    
    override var historyStyle: MBViewModelHistoryStyle { .ugly }
}
