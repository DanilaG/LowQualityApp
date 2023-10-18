//
//  MBExchangeRatesDto.swift
//  BugHub
//
//  Created by Danila on 09.09.2023.
//

import Foundation

/// Dto запроса курса валют
struct MBExchangeRatesDto: Decodable {
    /// Курсы валют
    let rates: Rates
}

extension MBExchangeRatesDto {
    /// Курсы валют к доллару
    struct Rates: Decodable {
        /// Китайский юань
        let CNY: Decimal?
    }
}
