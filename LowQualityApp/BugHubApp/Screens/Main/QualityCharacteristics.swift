//
//  QualityCharacteristics.swift
//  BugHub
//
//  Created by Danila on 13.08.2023.
//

import Foundation

/// Пример нарушения quality characteristics
enum QualityCharacteristics: CaseIterable, Hashable {
    /// Полнота
    case functionalCompleteness
    /// Корректность
    case functionalCorrectness
    /// Целесообразность
    case functionalAppropriateness
    /// Временные характеристики
    case timeBehaviour
    /// Использование ресурсов
    case resourceUtilization
    /// Потенциальные возможности
    case capacity
    /// Сосуществование
    case coExistence
    /// Функциональная совместимость
    case interoperability
    /// Узнаваемость назначения
    case appropriatenessRecognizability
    /// Изучаемость
    case learnability
    /// Операбельность
    case operability
    /// Защищенность от ошибки пользователя
    case userErrorProtection
    /// Эстетика пользовательского интерфейса
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
    /// Конфиденциальность
    case confidentiality
}

// MARK: - relationships

extension QualityCharacteristics {
    /// Усиливая данные атрибут усиливают и связанные с ним атрибуты
    var positiveRelationships: Set<QualityCharacteristics> {
        switch self {
        case .functionalCompleteness:
            return [.appropriatenessRecognizability, .learnability]
        case .functionalCorrectness:
            return [.maturity, .availability]
        case .functionalAppropriateness:
            return [.appropriatenessRecognizability, .learnability]
        case .timeBehaviour:
            return [.capacity, .operability]
        case .resourceUtilization:
            return [.timeBehaviour, .capacity, .coExistence, .availability]
        case .capacity:
            return [.maturity, .availability]
        case .coExistence:
            return [.functionalCorrectness, .maturity, .availability]
        case .interoperability:
            return [.functionalCorrectness, .coExistence, .maturity, .faultTolerance]
        case .appropriatenessRecognizability:
            return [.functionalAppropriateness, .learnability]
        case .learnability:
            return [.appropriatenessRecognizability]
        case .operability:
            return [.learnability, .userErrorProtection]
        case .userErrorProtection:
            return [.functionalCorrectness, .maturity]
        case .userInterfaceAesthetics:
            return []
        case .accessibility:
            return [.operability]
        case .maturity:
            return [.functionalCorrectness, .learnability, .availability, .faultTolerance]
        case .availability:
            return [.maturity, .faultTolerance]
        case .faultTolerance:
            return [.learnability, .maturity, .availability]
        case .recoverability:
            return [.availability]
        case .confidentiality:
            return []
        }
    }
    
    /// Усиливая данные атрибут, ослабляются из данного списка
    var negativeRelationships: Set<QualityCharacteristics> {
        switch self {
        case .functionalCompleteness:
            return []
        case .functionalCorrectness:
            return []
        case .functionalAppropriateness:
            return []
        case .timeBehaviour:
            return [.functionalCorrectness, .resourceUtilization, .maturity, .faultTolerance]
        case .resourceUtilization:
            return [.functionalCorrectness]
        case .capacity:
            return []
        case .coExistence:
            return []
        case .interoperability:
            return [.timeBehaviour, .capacity]
        case .appropriatenessRecognizability:
            return []
        case .learnability:
            return [.resourceUtilization, .userErrorProtection]
        case .operability:
            return [.resourceUtilization]
        case .userErrorProtection:
            return [.timeBehaviour]
        case .userInterfaceAesthetics:
            return [.resourceUtilization, .capacity]
        case .accessibility:
            return [.timeBehaviour, .resourceUtilization, .capacity]
        case .maturity:
            return []
        case .availability:
            return []
        case .faultTolerance:
            return [.timeBehaviour, .resourceUtilization]
        case .recoverability:
            return [.timeBehaviour, .resourceUtilization]
        case .confidentiality:
            return [.timeBehaviour, .interoperability, .operability, .availability, .recoverability]
        }
    }
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
        case .confidentiality:
            return Localization.Confidentiality.title
        }
    }
}
