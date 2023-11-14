//
//  DescriptionScreenView.AttributeItemView.swift
//  BugHub
//
//  Created by Danila on 12.11.2023.
//

import SwiftUI
import YandexMobileMetrica

extension DescriptionScreenView {
    struct AttributeItemView: View {
        /// Данные для отображения
        struct ViewData {
            /// Заголовок атрибута
            let title: String
            /// Описание атрибута
            let description: String
        }
        /// Данные метрики
        struct MetricData {
            /// Название характеристики из которой открыли
            let fromQualityCharacteristic: String
            /// Название характеристики для которой открыли
            let forQualityCharacteristic: String
        }
        
        @State private var isShowingDescription: Bool = false
        @State private var textHeight: CGFloat = 0
        
        private let viewData: ViewData
        private let metricData: MetricData
        
        /// Инициализатор
        /// - Parameters:
        ///  - viewData: данные для отображения
        ///  - metricData: данные метрики
        init(
            viewData: ViewData,
            metricData: MetricData
        ) {
            self.viewData = viewData
            self.metricData = metricData
        }
        
        var body: some View {
            Button(action: {
                YMMYandexMetrica.reportEvent("open_short_description", parameters: [
                    "for_quality_characteristic": metricData.forQualityCharacteristic,
                    "from": ["quality_characteristic": metricData.fromQualityCharacteristic]
                ])
                isShowingDescription = true
            }) {
                HStack {
                    Text(viewData.title)
                        .foregroundColor(Color(UIColor.label))
                    Spacer()
                }
            }
            .popover(
                isPresented: $isShowingDescription,
                attachmentAnchor: .point(.center)
            ) {
                content
            }
        }
        
        private var content: some View {
            Text("**\(viewData.title)** - \(viewData.description)")
                .overlay(
                    GeometryReader { proxy in
                        Color
                            .clear
                            .preference(
                                key: ContentLengthPreference.self,
                                value: proxy.size.height
                            )
                    }
                )
                .onPreferenceChange(ContentLengthPreference.self) { value in
                    Task { @MainActor in self.textHeight = value }
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: textHeight)
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
                .presentationDetents([.height(textHeight + 20 * 2)])
        }
    }
}

struct ContentLengthPreference: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
