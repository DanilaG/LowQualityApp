//
//  DescriptionScreenView.swift
//  LowQualityApp
//
//  Created by Danila on 02.09.2023.
//

import SwiftUI
import YandexMobileMetrica

/// Экран описания характеристики качества
struct DescriptionScreenView: View {
    /// View data для экрана описания
    struct ViewData {
        /// Описание характеристики качества
        struct QualityCharacteristic {
            /// Заголовок характеристики качества
            let title: String
            /// Описание характеристики качества
            let description: String
            /// Название для метрики
            let metricaTitle: String
        }
        /// Описание примера
        struct Example {
            /// Приложения
            struct App {
                /// Название приложения
                let name: String
                /// Описание приложения
                let description: String?
                /// Сборщик экрана тестового приложения
                let screenFactory: @MainActor () -> AnyView
                /// Сборщик эталона приложения
                let standardAppScreenFactory: @MainActor () -> AnyView
                /// Название для метрики
                let metricaName: String
            }
            
            /// Приложения
            let app: App
            /// Описание задачи
            let task: String
            /// Подсказка с описанием ошибки
            let hint: String
        }
        
        /// Описание характеристики качества
        let qualityCharacteristic: QualityCharacteristic
        /// Описание примера
        let example: Example
    }
    
    private enum AppVersion: Int, Identifiable {
        case withDefect
        case standard
        
        var id: Int { rawValue }
    }
    
    private typealias Strings = Localization.Description
    
    /// View data для экрана описания
    let viewData: ViewData

    @State private var showingApp: AppVersion?
    
    var body: some View {
        Form {
            Section(header: Text(Strings.description)) {
                Text("**\(viewData.qualityCharacteristic.title)** - \(viewData.qualityCharacteristic.description)")
            }
            Section(
                header: Text(Strings.example),
                footer: viewData.example.app.description.flatMap({ Text($0) }) ?? nil
            ) {
                HStack {
                    Text(Strings.application)
                    Spacer()
                    Text(viewData.example.app.name)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
            }
            
            Section(
                header: Text(Strings.task),
                footer: Text(Strings.Task.hint)
            ) {
                Text(viewData.example.task)
            }
            
            Section(
                footer: (Text(viewData.example.hint) + Text(". [\(Strings.seeStandard)](standard)"))
                    .environment(\.openURL, OpenURLAction { _ in
                        showingApp = .standard
                        YMMYandexMetrica.reportEvent("open_standard_example", parameters: [
                            "app": viewData.example.app.metricaName,
                            "quality_characteristic": viewData.qualityCharacteristic.metricaTitle,
                        ])
                        return .handled
                    })
            ) {
                HStack {
                    Spacer()
                    Button(Strings.try, action: {
                        showingApp = .withDefect
                        YMMYandexMetrica.reportEvent("open_with_defect_example", parameters: [
                            "app": viewData.example.app.metricaName,
                            "quality_characteristic": viewData.qualityCharacteristic.metricaTitle,
                        ])
                    })
                    Spacer()
                }
            }
            }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewData.qualityCharacteristic.title)
        .fullScreenCover(item: $showingApp) {
            switch $0 {
            case .withDefect:
                SampleAppViewWrapper {
                    viewData.example.app.screenFactory()
                }
            case .standard:
                SampleAppViewWrapper {
                    viewData.example.app.standardAppScreenFactory()
                }
            }
        }
        .onAppear {
            YMMYandexMetrica.reportEvent("open_description", parameters: [
                "quality_characteristic": viewData.qualityCharacteristic.metricaTitle,
            ])
        }
    }
}

struct DescriptionScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionScreenView(viewData: .init(
            qualityCharacteristic: .init(
                title: "Test",
                description: "degree to which a product or system can be used by people with the widest range of characteristics and capabilities to achieve a specified goal in a specified context of use.",
                metricaTitle: "test"
            ),
            example: .init(
                app: .init(
                    name: "Копилка",
                    description: "Приложение для учёта накопленных денег",
                    screenFactory: { AnyView(Text("Test")) },
                    standardAppScreenFactory: { AnyView(Text("Test")) },
                    metricaName: "test"
                ),
                task: "Уменьшить баланс накопленных средств в приложении",
                hint: "В данной версии приложения вы не сможете уменьшить баланс, так как такой функционал отсутсвует"
            )
        ))
    }
}
