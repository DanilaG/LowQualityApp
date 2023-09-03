//
//  QualityCharacteristics+DescriptionViewData.swift
//  LowQualityApp
//
//  Created by Danila on 03.09.2023.
//

import Foundation

extension QualityCharacteristics {
    /// View data для описания  quality characteristics
    var descriptionViewData: DescriptionScreenView.ViewData {
        switch self {
        default:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.FunctionalCompleteness.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp,
                    task: Localization.FunctionalCompleteness.task,
                    hint: Localization.FunctionalCompleteness.Task.hint
                )
            )
        }
    }
    
    fileprivate static let moneyBoxApp = DescriptionScreenView.ViewData.Example.App(
        name: Localization.SampleApp.MoneyBox.title,
        description: Localization.SampleApp.MoneyBox.description
    )
}
