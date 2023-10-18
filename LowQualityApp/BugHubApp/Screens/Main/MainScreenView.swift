//
//  MainScreenView.swift
//  BugHub
//
//  Created by Danila on 13.08.2023.
//

import SwiftUI
import YandexMobileMetrica

/// Главный экран приложения
struct MainScreenView: View {
    private typealias Strings = Localization.List
    
    var body: some View {
        NavigationStack {
            Form {
                Section(Strings.Section.functionalSuitability) {
                    makeItem(for: .functionalCompleteness)
                    makeItem(for: .functionalCorrectness)
                    makeItem(for: .functionalAppropriateness)
                }
                Section(Strings.Section.performanceEfficiency) {
                    makeItem(for: .timeBehaviour)
                    makeItem(for: .resourceUtilization)
                    makeItem(for: .capacity)
                }
                Section(Strings.Section.compatibility) {
                    makeItem(for: .coExistence)
                    makeItem(for: .interoperability)
                }
                Section(Strings.Section.usability) {
                    makeItem(for: .appropriatenessRecognizability)
                    makeItem(for: .learnability)
                    makeItem(for: .operability)
                    makeItem(for: .userErrorProtection)
                    makeItem(for: .userInterfaceAesthetics)
                    makeItem(for: .accessibility)
                }
                Section(Strings.Section.reliability) {
                    makeItem(for: .maturity)
                    makeItem(for: .availability)
                    makeItem(for: .faultTolerance)
                    makeItem(for: .recoverability)
                }
                Section(
                    footer: Text(
                        (try? AttributedString(markdown: Strings.isoHint)) ??
                        AttributedString(Strings.isoHint)
                    )
                    .environment(\.openURL, OpenURLAction { url in
                        YMMYandexMetrica.reportEvent("open_ISO")
                        return .systemAction(url)
                    })
                ) {}
            }
            .navigationTitle(Strings.title)
            .navigationDestination(for: QualityCharacteristics.self) {
                DescriptionScreenView(viewData: $0.descriptionViewData)
            }
        }
    }
    
    private func makeItem(for sample: QualityCharacteristics) -> some View {
        NavigationLink(sample.title, value: sample)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
