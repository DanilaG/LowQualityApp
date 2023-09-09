//
//  MBExchangeRatesRepository.swift
//  LowQualityApp
//
//  Created by Danila on 09.09.2023.
//

import Foundation

/// Репозиторий курса валют
protocol MBExchangeRatesRepository {
    /// Курс доллара к юаню
    var usdToCny: Decimal { get async throws }
}

/// Реализация репозитория курса валют
final class MBExchangeRatesRepositoryImpl: MBExchangeRatesRepository {
    var usdToCny: Decimal {
        get async throws {
            guard let url = URL(string: "https://api.exchangerate.host/latest?base=USD") else {
                throw UrlCreateError()
            }
            var urlRequest = URLRequest(url: url)
            urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            guard let cny = try JSONDecoder().decode(MBExchangeRatesDto.self, from: data).rates.CNY else {
                throw DateCompletenessError()
            }
            return cny
        }
    }
}

/// Ошибка создания URL
struct UrlCreateError: LocalizedError {
    let errorDescription: String? = "Ошибка создания URL"
}

/// Ошибка получения нужных данных
struct DateCompletenessError: LocalizedError {
    let errorDescription: String? = "Ответ не содержит нужные данные"
}
