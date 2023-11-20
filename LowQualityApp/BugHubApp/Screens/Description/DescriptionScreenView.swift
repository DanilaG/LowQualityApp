//
//  DescriptionScreenView.swift
//  BugHub
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
            /// Атрибут с которым есть взаимоотношения
            struct RelatedAttribute {
                /// Заголовок
                let title: String
                /// Название в метрике
                let metricName: String
                /// Описание
                let description: String
            }
            
            /// Заголовок характеристики качества
            let title: String
            /// Описание характеристики качества
            let description: String
            /// Оказывает позитивный эффект на данные атрибуты
            let positiveRelationships: [RelatedAttribute]
            /// Оказывает негативный эффект на данные атрибуты
            let negativeRelationships: [RelatedAttribute]
        }
        /// Описание примера
        struct Example {
            /// Приложения
            struct App {
                /// Сборщик экрана тестового приложения
                let defectScreenFactory: @MainActor () -> AnyView
                /// Сборщик эталона приложения
                let standardAppScreenFactory: @MainActor () -> AnyView
            }
            /// Приложения
            let app: App
            /// Описание контекста
            let context: String
            /// Описание задачи
            let task: String
            /// Описание дефекта
            let defect: String
        }
        /// Описание характеристики качества
        let qualityCharacteristic: QualityCharacteristic
        /// Описание примера
        let example: Example?
        /// Deep link для открытия
        let deepLink: URL?
    }
    /// Данные для метрики
    struct MetricaData {
        /// Название атрибута
        let qualityCharacteristicName: String
    }
    
    private typealias Strings = Localization.Description
    
    /// View data для экрана описания
    let viewData: ViewData
    /// Данные для метрики
    let metricaData: MetricaData

    @State private var showExample: SampleDescriptionScreenView.ViewData?
    
    var body: some View {
        Form {
            Section(header: Text(Strings.description)) {
                Text("**\(viewData.qualityCharacteristic.title)** - \(viewData.qualityCharacteristic.description)")
            }
            
            if let example = SampleDescriptionScreenView.ViewData.make(from: viewData) {
                Section(
                    footer: Text(Strings.Example.Button.hint)
                ) {
                    HStack {
                        Spacer()
                        Button(Strings.Example.button, action: {
                            showExample = example
                        })
                        Spacer()
                    }
                }
            }
            
            if !viewData.qualityCharacteristic.positiveRelationships.isEmpty {
                Section(
                    header: Text(Strings.Relationships.positive),
                    footer: Text(Strings.Relationships.Positive.hint(viewData.qualityCharacteristic.title))
                ) {
                    ForEach(viewData.qualityCharacteristic.positiveRelationships, id: \.title) { item in
                        AttributeItemView(
                            viewData: .init(
                                title: item.title,
                                description: item.description
                            ),
                            metricData: .init(
                                fromQualityCharacteristic: metricaData.qualityCharacteristicName,
                                forQualityCharacteristic: item.metricName
                            )
                        )
                    }
                }
                
            }
            
            if !viewData.qualityCharacteristic.negativeRelationships.isEmpty {
                Section(
                    header: Text(Strings.Relationships.negative),
                    footer: Text(Strings.Relationships.Negative.hint(viewData.qualityCharacteristic.title))
                ) {
                    ForEach(viewData.qualityCharacteristic.negativeRelationships, id: \.title) { item in
                        AttributeItemView(
                            viewData: .init(
                                title: item.title,
                                description: item.description
                            ),
                            metricData: .init(
                                fromQualityCharacteristic: metricaData.qualityCharacteristicName,
                                forQualityCharacteristic: item.metricName
                            )
                        )
                    }
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewData.qualityCharacteristic.title)
        .toolbar {
            if let deepLink = viewData.deepLink {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ShareLink(item: deepLink)
                }
            }
        }
        .sheet(item: $showExample) { viewData in
            NavigationStack {
                SampleDescriptionScreenView(
                    viewData: viewData,
                    metricaData: .make(from: metricaData)
                )
            }
        }
        .onAppear {
            YMMYandexMetrica.reportEvent("open_description", parameters: [
                "quality_characteristic": metricaData.qualityCharacteristicName,
            ])
        }
    }
}

struct DescriptionScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionScreenView(
            viewData: .init(
                qualityCharacteristic: .init(
                    title: "Test",
                    description: "degree to which a product or system can be used by people with the widest range of characteristics and capabilities to achieve a specified goal in a specified context of use.",
                    positiveRelationships: [],
                    negativeRelationships: []
                ),
                example: .init(
                    app: .init(
                        defectScreenFactory: { AnyView(Text("Test")) },
                        standardAppScreenFactory: { AnyView(Text("Test")) }),
                    context: "Изучите пример нарушения атрибута качества для лучшего понимания значимости атрибута",
                    task: "Уменьшить баланс накопленных средств в приложении",
                    defect: "В данной версии приложения вы не сможете уменьшить баланс, так как такой функционал отсутсвует"
                ),
                deepLink: nil
            ),
            metricaData: .init(
                qualityCharacteristicName: "test"
            )
        )
    }
}

extension SampleDescriptionScreenView.ViewData: Identifiable {
    var id: String { attributeTitle }
}
