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
           
        case .functionalAppropriateness:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.FunctionalAppropriateness.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBFunctionalAppropriatenessViewModel(
                            model: MBModelWithData(),
                            repository: MBExchangeRatesRepositoryImpl()
                        )
                    ),
                    task: Localization.FunctionalAppropriateness.task,
                    hint: Localization.FunctionalAppropriateness.Task.hint
                )
            )
            
        case .timeBehaviour:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.TimeBehaviour.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBTimeBehaviourViewModel(model: MBModelWithData())
                    ),
                    task: Localization.TimeBehaviour.task,
                    hint: Localization.TimeBehaviour.Task.hint
                )
            )
            
        case .resourceUtilization:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.ResourceUtilization.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        model: MBResourceUtilizationModel()
                    ),
                    task: Localization.ResourceUtilization.task,
                    hint: Localization.ResourceUtilization.Task.hint
                )
            )
            
        case .capacity:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.Capacity.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBCapacityViewModel(model: MBCapacityModel())
                    ),
                    task: Localization.Capacity.task,
                    hint: Localization.Capacity.Task.hint
                )
            )
            
        case .coExistence:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.CoExistence.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBCoExistenceViewModel(model: MBModelWithData())
                    ),
                    task: Localization.CoExistence.task,
                    hint: Localization.CoExistence.Task.hint
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
        model: @escaping @autoclosure () -> MBModel = MBModelWithData()
    ) -> DescriptionScreenView.ViewData.Example.App {
        moneyBoxApp(viewModel: MBDefaultViewModel(model: model()))
    }
    
    fileprivate static func moneyBoxApp<ViewModel: MBViewModel>(
        viewModel: @escaping @autoclosure () -> ViewModel
    ) -> DescriptionScreenView.ViewData.Example.App {
        return .init(
            name: Localization.SampleApp.MoneyBox.title,
            description: Localization.SampleApp.MoneyBox.description,
            screenFactory: { @MainActor in AnyView(MBMainScreenView(viewModel())) }
        )
    }
}
