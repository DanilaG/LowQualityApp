//
//  SampleDescriptionScreenView.swift
//  BugHub
//
//  Created by Danila on 29.10.2023.
//

import SwiftUI
import YandexMobileMetrica

/// Экран для отображения пример
struct SampleDescriptionScreenView: View {
    /// Данные для отображения
    struct ViewData {
        /// Название атрибута
        let attributeTitle: String
        /// Описание контекста
        let context: String
        /// Описание задачи
        let task: String
        /// Описание дефекта
        let defect: String
        /// Сборщик экрана приложения с дефектом
        let defectScreenFactory: @MainActor () -> AnyView
        /// Сборщик эталона приложения
        let standardAppScreenFactory: @MainActor () -> AnyView
    }
    /// Данные для метрики
    struct MetricaData {
        /// Название атрибута
        let qualityCharacteristicName: String
    }
    /// Тип приложения которое открыть
    private enum AppType: Int, Identifiable {
        case withDefect
        case standard
        
        var id: Int { rawValue }
    }
    
    private typealias Strings = Localization.Description.Example
    
    @Environment(\.dismiss) var dismiss
    @State private var showingApp: AppType?
    
    /// View data для экрана описания
    let viewData: ViewData
    /// Данные для метрики
    let metricaData: MetricaData
    
    var body: some View {
        Form {
            Section(
                header: Text(Strings.context)
            ) {
                Text(viewData.context)
            }
            
            Section(
                header: Text(Strings.task),
                footer: Text(Strings.Task.hint)
            ) {
                Text(viewData.task)
            }

            Section(
                header: Text(Strings.defect),
                footer: Text(Strings.Defect.hint(viewData.attributeTitle))
            ) {
                Text(viewData.defect)
            }
            
            Section(
                footer: (
                    Text((try? AttributedString(markdown: Strings.Try.hint)) ?? AttributedString(Strings.Try.hint))
                    .environment(\.openURL, OpenURLAction { _ in
                        showingApp = .standard
                        YMMYandexMetrica.reportEvent(
                            "open_standard_example",
                            parameters: [
                                "quality_characteristic": metricaData.qualityCharacteristicName,
                            ]
                        )
                        return .handled
                    })
                )
            ) {
                HStack {
                    Spacer()
                    Button(Strings.try, action: {
                        showingApp = .withDefect
                        YMMYandexMetrica.reportEvent(
                            "open_with_defect_example",
                            parameters: [
                                "quality_characteristic": metricaData.qualityCharacteristicName,
                                "source": "main_button"
                            ]
                        )
                    })
                    Spacer()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Strings.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(Strings.done) { dismiss() }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(Strings.try) {
                    showingApp = .withDefect
                    YMMYandexMetrica.reportEvent(
                        "open_with_defect_example",
                        parameters: [
                            "quality_characteristic": metricaData.qualityCharacteristicName,
                            "source": "nav_button"
                        ]
                    )
                }
            }
        }
        .fullScreenCover(item: $showingApp) {
            switch $0 {
            case .withDefect:
                ExampleAppViewWrapper {
                    viewData.defectScreenFactory()
                }
            case .standard:
                ExampleAppViewWrapper {
                    viewData.standardAppScreenFactory()
                }
            }
        }
        .onAppear {
            YMMYandexMetrica.reportEvent("open_example_description", parameters: [
                "quality_characteristic": metricaData.qualityCharacteristicName
            ])
        }
    }
}

struct ExampleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SampleDescriptionScreenView(
            viewData: .init(
                attributeTitle: "test",
                context: "test",
                task: "test",
                defect: "test",
                defectScreenFactory: { AnyView(Text("test")) },
                standardAppScreenFactory: { AnyView(Text("test")) }
            ),
            metricaData: .init(qualityCharacteristicName: "test")
        )
    }
}
