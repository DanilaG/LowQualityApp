//
//  QualityCharacteristics.swift
//  LowQualityApp
//
//  Created by Danila on 13.08.2023.
//

import Foundation

/// Пример нарушения quality characteristics
enum QualityCharacteristics: Hashable {
    /// Завершенность
    case functionalCompleteness
    /// Корректность
    case functionalCorrectness
    /// Уместность
    case functionalAppropriateness
    /// Производительность
    case timeBehaviour
    /// Потребляемость ресурсов
    case resourceUtilization
    /// Ёмкость
    case capacity
    /// Сосуществование
    case coExistence
    /// Функциональная совместимость
    case interoperability
    /// Узнаваемость назначения
    case appropriatenessRecognizability
    /// Обучаемость
    case learnability
    /// Операбельность
    case operability
    /// Защита от ошибок
    case userErrorProtection
    /// Эстетичность
    case userInterfaceAesthetics
    /// Доступность интерфейса
    case accessibility
    /// Зрелость
    case maturity
    /// Доступность функциональности
    case availability
    /// Отказоустойчивость
    case faultTolerance
    /// Восстанавливаемость
    case recoverability
}

// MARK: - titles

extension QualityCharacteristics {
    /// Заголовок quality characteristic-и
    var title: String {
        switch self {
        case .functionalCompleteness:
            return Localization.FunctionalCompleteness.title
        case .functionalCorrectness:
            return Localization.FunctionalCorrectness.title
        case .functionalAppropriateness:
            return Localization.FunctionalAppropriateness.title
        case .timeBehaviour:
            return Localization.TimeBehaviour.title
        case .resourceUtilization:
            return Localization.ResourceUtilization.title
        case .capacity:
            return Localization.Capacity.title
        case .coExistence:
            return Localization.CoExistence.title
        case .interoperability:
            return Localization.Interoperability.title
        case .appropriatenessRecognizability:
            return Localization.AppropriatenessRecognizability.title
        case .learnability:
            return Localization.Learnability.title
        case .operability:
            return Localization.Operability.title
        case .userErrorProtection:
            return Localization.UserErrorProtection.title
        case .userInterfaceAesthetics:
            return Localization.UserInterfaceAesthetics.title
        case .accessibility:
            return Localization.Accessibility.title
        case .maturity:
            return Localization.Maturity.title
        case .availability:
            return Localization.Availability.title
        case .faultTolerance:
            return Localization.FaultTolerance.title
        case .recoverability:
            return Localization.Recoverability.title
        }
    }
}
