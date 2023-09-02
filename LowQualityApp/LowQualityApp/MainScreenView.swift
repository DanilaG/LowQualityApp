//
//  MainScreenView.swift
//  LowQualityApp
//
//  Created by Danila on 13.08.2023.
//

import SwiftUI

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
            }
            .navigationTitle(Strings.title)
            .navigationDestination(for: QualityCharacteristics.self) {
                Text($0.title)
            }
        }
    }
    
    func makeItem(for sample: QualityCharacteristics) -> some View {
        NavigationLink(sample.title, value: sample)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
        .environment(\.locale, .init(identifier: "ru"))
    }
}
