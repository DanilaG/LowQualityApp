//
//  QualityCharacteristics+DescriptionViewData.swift
//  LowQualityApp
//
//  Created by Danila on 03.09.2023.
//

import SwiftUI

extension QualityCharacteristics {
    /// View data для описания  quality characteristics
    var descriptionViewData: DescriptionScreenView.ViewData {
        switch self {
            
        case .functionalCompleteness:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.FunctionalCompleteness.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBFunctionalCompletenessViewModel(model: MBModelWithData())
                    ),
                    task: Localization.FunctionalCompleteness.task,
                    hint: Localization.FunctionalCompleteness.Task.hint
                )
            )
            
        case .functionalCorrectness:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.FunctionalCorrectness.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        model: MBFunctionalCorrectnessModel()
                    ),
                    task: Localization.FunctionalCorrectness.task,
                    hint: Localization.FunctionalCorrectness.Task.hint
                )
            )
            
        default:
            return .init(
                qualityCharacteristic: .init(
                    title: "Test",
                    description: Localization.FunctionalCompleteness.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(),
                    task: Localization.FunctionalCompleteness.task,
                    hint: Localization.FunctionalCompleteness.Task.hint
                )
            )
        }
    }
    
    fileprivate static func moneyBoxApp(
        model: MBModel = MBModelWithData()
    ) -> DescriptionScreenView.ViewData.Example.App {
        moneyBoxApp(viewModel: MBDefaultViewModel(model: model))
    }
    
    fileprivate static func moneyBoxApp<ViewModel: MBViewModel>(
        viewModel: ViewModel
    ) -> DescriptionScreenView.ViewData.Example.App {
        return .init(
            name: Localization.SampleApp.MoneyBox.title,
            description: Localization.SampleApp.MoneyBox.description,
            screenFactory: { @MainActor in AnyView(MBMainScreenView(viewModel)) }
        )
    }
}
