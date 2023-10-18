//
//  NumberFormatters.swift
//  BugHub
//
//  Created by Danila on 05.09.2023.
//

import Foundation

/// Дефолтные форматеры для приложения
enum NumberFormatters {
    
    /// Форматер для Decimal
    class Decimal: NumberFormatter {
        /// Инициализатор форматера для Decimal
        override init() {
            super.init()
            
            maximumFractionDigits = 2
            minimumFractionDigits = 2
            locale = Locale.current
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    /// Форматер для отображения денег
    class MoneyOutput: Decimal {
        /// Инициализатор форматера отображения денег
        override init() {
            super.init()
            numberStyle = .currency
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    /// Форматер для ввода денег
    class MoneyInput: Decimal {        
        private var prefix: String {
            currencyCode + " "
        }
        
        override func string(from number: NSNumber) -> String? {
            super.string(from: number).flatMap({ prefix + $0 })
        }
        
        override func number(from string: String) -> NSNumber? {
            guard
                string.hasPrefix(prefix),
                string.count > prefix.count
            else { return nil }
            return super.number(from: String(string[string.index(string.startIndex, offsetBy: prefix.count)...]))
        }
    }
}
