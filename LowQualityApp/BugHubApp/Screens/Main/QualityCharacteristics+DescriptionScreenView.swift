//
//  QualityCharacteristics+DescriptionScreenView.swift
//  BugHub
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
                    context: Localization.FunctionalCompleteness.context,
                    task: Localization.FunctionalCompleteness.task,
                    defect: Localization.FunctionalCompleteness.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.FunctionalCorrectness.context,
                    task: Localization.FunctionalCorrectness.task,
                    defect: Localization.FunctionalCorrectness.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.FunctionalAppropriateness.context,
                    task: Localization.FunctionalAppropriateness.task,
                    defect: Localization.FunctionalAppropriateness.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.TimeBehaviour.context,
                    task: Localization.TimeBehaviour.task,
                    defect: Localization.TimeBehaviour.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.ResourceUtilization.context,
                    task: Localization.ResourceUtilization.task,
                    defect: Localization.ResourceUtilization.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.Capacity.context,
                    task: Localization.Capacity.task,
                    defect: Localization.Capacity.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.CoExistence.context,
                    task: Localization.CoExistence.task,
                    defect: Localization.CoExistence.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.Interoperability.context,
                    task: Localization.Interoperability.task,
                    defect: Localization.Interoperability.defect
                ),
                deepLink: makeDeeplink()
            )
            
        case .appropriatenessRecognizability:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.AppropriatenessRecognizability.description
                ),
                example: .init(
                    app: QualityCharacteristics.callToApp(),
                    context: Localization.AppropriatenessRecognizability.context,
                    task: Localization.AppropriatenessRecognizability.task,
                    defect: Localization.AppropriatenessRecognizability.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.Learnability.context,
                    task: Localization.Learnability.task,
                    defect: Localization.Learnability.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.Operability.context,
                    task: Localization.Operability.task,
                    defect: Localization.Operability.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.UserErrorProtection.context,
                    task: Localization.UserErrorProtection.task,
                    defect: Localization.UserErrorProtection.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.UserInterfaceAesthetics.context,
                    task: Localization.UserInterfaceAesthetics.task,
                    defect: Localization.UserInterfaceAesthetics.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.Accessibility.context,
                    task: Localization.Accessibility.task,
                    defect: Localization.Accessibility.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.Maturity.context,
                    task: Localization.Maturity.task,
                    defect: Localization.Maturity.defect
                ),
                deepLink: makeDeeplink()
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
                    context: Localization.Availability.context,
                    task: Localization.Availability.task,
                    defect: Localization.Availability.defect
                ),
                deepLink: makeDeeplink()
            )
            
        case .faultTolerance:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.FaultTolerance.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBFaultToleranceViewModel(model: MBModelWithData())
                    ),
                    context: Localization.FaultTolerance.context,
                    task: Localization.FaultTolerance.task,
                    defect: Localization.FaultTolerance.defect
                ),
                deepLink: makeDeeplink()
            )
          
        case .recoverability:
            return .init(
                qualityCharacteristic: .init(
                    title: title,
                    description: Localization.Recoverability.description
                ),
                example: .init(
                    app: QualityCharacteristics.moneyBoxApp(
                        viewModel: MBRecoverabilityViewModel(model: MBRecoverabilityModel())
                    ),
                    context: Localization.Recoverability.context,
                    task: Localization.Recoverability.task,
                    defect: Localization.Recoverability.defect
                ),
                deepLink: makeDeeplink()
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
            defectScreenFactory: { @MainActor in AnyView(MBMainScreenView(viewModel())) },
            standardAppScreenFactory: { @MainActor in standardMoneyBoxScreen() }
        )
    }
    
    fileprivate static func callToApp() -> DescriptionScreenView.ViewData.Example.App {
        return .init(
            defectScreenFactory: { @MainActor in
                AnyView(CallToScreenView(
                    viewData: .init(
                        title: Localization.SampleApp.CallTo.MoneyBox.title,
                        description: Localization.SampleApp.CallTo.MoneyBox.description,
                        actionTitle: Localization.SampleApp.CallTo.MoneyBox.action,
                        url: URL(string: "tel:\(Localization.SampleApp.CallTo.MoneyBox.phone)")
                    )
                ))
            },
            standardAppScreenFactory: { @MainActor in standardMoneyBoxScreen() }
        )
    }
    
    fileprivate static func standardMoneyBoxScreen() -> AnyView {
        AnyView(MBMainScreenView(MBDefaultViewModel(model: MBModelWithData())))
    }
}

extension QualityCharacteristics {
    var metricaData: DescriptionScreenView.MetricaData {
        switch self {
        case .functionalCompleteness:
            return .init(qualityCharacteristicName: "functional_completeness")
        case .functionalCorrectness:
            return .init(qualityCharacteristicName: "functional_correctness")
        case .functionalAppropriateness:
            return .init(qualityCharacteristicName: "functional_appropriateness")
        case .timeBehaviour:
            return .init(qualityCharacteristicName: "time_behaviour")
        case .resourceUtilization:
            return .init(qualityCharacteristicName: "resource_utilization")
        case .capacity:
            return .init(qualityCharacteristicName: "capacity")
        case .coExistence:
            return .init(qualityCharacteristicName: "co-existence")
        case .interoperability:
            return .init(qualityCharacteristicName: "interoperability")
        case .appropriatenessRecognizability:
            return .init(qualityCharacteristicName: "appropriateness_recognizability")
        case .learnability:
            return .init(qualityCharacteristicName: "learnability")
        case .operability:
            return .init(qualityCharacteristicName: "operability")
        case .userErrorProtection:
            return .init(qualityCharacteristicName: "user_error_protection")
        case .userInterfaceAesthetics:
            return .init(qualityCharacteristicName: "user_interface_aesthetics")
        case .accessibility:
            return .init(qualityCharacteristicName: "accessibility")
        case .maturity:
            return .init(qualityCharacteristicName: "maturity")
        case .availability:
            return .init(qualityCharacteristicName: "availability")
        case .faultTolerance:
            return .init(qualityCharacteristicName: "fault_tolerance")
        case .recoverability:
            return .init(qualityCharacteristicName: "recoverability")
        }
    }
}
