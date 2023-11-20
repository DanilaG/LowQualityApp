//
//  DeepLinksHandler.swift
//  BugHub
//
//  Created by Danila on 28.10.2023.
//

import Foundation

extension QualityCharacteristics {
    
    private static let host = "bughub.page.link"
    
    private var linkName: String {
        switch self {
        case .functionalCompleteness:
            return "functional-completeness"
        case .functionalCorrectness:
            return "functional-correctness"
        case .functionalAppropriateness:
            return "functional-appropriateness"
        case .timeBehaviour:
            return "time-behaviour"
        case .resourceUtilization:
            return "resource-utilization"
        case .capacity:
            return "capacity"
        case .coExistence:
            return "co-existence"
        case .interoperability:
            return "interoperability"
        case .appropriatenessRecognizability:
            return "appropriateness-recognizability"
        case .learnability:
            return "learnability"
        case .operability:
            return "operability"
        case .userErrorProtection:
            return "user-error-protection"
        case .userInterfaceAesthetics:
            return "user-interface-aesthetics"
        case .accessibility:
            return "accessibility"
        case .maturity:
            return "maturity"
        case .availability:
            return "availability"
        case .faultTolerance:
            return "fault-tolerance"
        case .recoverability:
            return "recoverability"
        case .confidentiality:
            return "confidentiality"
        }
    }
    
    func makeDeeplink() -> URL? {
        return URL(string: "https://\(QualityCharacteristics.host)/\(linkName)")
    }
    
    init?(from deepLink: URL) {
        guard
            deepLink.host == QualityCharacteristics.host,
            let characteristic = QualityCharacteristics.allCases.first(
                where: { deepLink.path == "/\($0.linkName)" }
            )
        else { return nil }
        self = characteristic
    }
}
