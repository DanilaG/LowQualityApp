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

        case .interoperability:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.Interoperability.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBInteroperabilityViewModel(model: MBModelWithData())
                    ),
                    task: Localization.Interoperability.task,
                    hint: Localization.Interoperability.Task.hint
                )
            )
            
        case .appropriatenessRecognizability:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.AppropriatenessRecognizability.description
                ),
                example: .init(
                    app: QualityCharacteristics.callToApp(),
                    task: Localization.AppropriatenessRecognizability.task,
                    hint: Localization.AppropriatenessRecognizability.Task.hint
                )
            )
            
        case .learnability:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.Learnability.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBLearnabilityViewModel(model: MBModelWithData())
                    ),
                    task: Localization.Learnability.task,
                    hint: Localization.Learnability.Task.hint
                )
            )
            
        case .operability:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.Operability.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBOperabilityViewModel(model: MBModelWithData())
                    ),
                    task: Localization.Operability.task,
                    hint: Localization.Operability.Task.hint
                )
            )
            
        case .userErrorProtection:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.UserErrorProtection.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        model: MBUserErrorProtectionModel()
                    ),
                    task: Localization.UserErrorProtection.task,
                    hint: Localization.UserErrorProtection.Task.hint
                )
            )
            
        case .userInterfaceAesthetics:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.UserInterfaceAesthetics.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBUserInterfaceAestheticsViewModel(model: MBModelWithData())
                    ),
                    task: Localization.UserInterfaceAesthetics.task,
                    hint: Localization.UserInterfaceAesthetics.Task.hint
                )
            )
            
        case .accessibility:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.Accessibility.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBAccessibilityViewModel(model: MBModelWithData())
                    ),
                    task: Localization.Accessibility.task,
                    hint: Localization.Accessibility.Task.hint
                )
            )
            
        case .maturity:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.Maturity.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBMaturityViewModel(model: MBModelWithData())
                    ),
                    task: Localization.Maturity.task,
                    hint: Localization.Maturity.Task.hint
                )
            )
            
        case .availability:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.Availability.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBAvailabilityViewModel(model: MBModelWithData())
                    ),
                    task: Localization.Availability.task,
                    hint: Localization.Availability.Task.hint
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
    
    fileprivate static func callToApp() -> DescriptionScreenView.ViewData.Example.App {
        return .init(
            name: Localization.SampleApp.CallTo.MoneyBox.Title.short,
            description: nil,
            screenFactory: { @MainActor in
                AnyView(CallToScreenView(
                    viewData: .init(
                        title: Localization.SampleApp.CallTo.MoneyBox.title,
                        description: Localization.SampleApp.CallTo.MoneyBox.description,
                        actionTitle: Localization.SampleApp.CallTo.MoneyBox.action,
                        url: URL(string: "tel:\(Localization.SampleApp.CallTo.MoneyBox.phone)")
                    )
                ))
            }
        )
    }
}
