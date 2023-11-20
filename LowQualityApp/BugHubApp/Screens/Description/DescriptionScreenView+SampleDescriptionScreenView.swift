//
//  DescriptionScreenView+SampleDescriptionScreenView.swift
//  BugHub
//
//  Created by Danila on 30.10.2023.
//

import Foundation

extension SampleDescriptionScreenView.ViewData {
    /// Адаптер view данных экрана атрибута в экран примера
    /// - Parameter viewData: данные для отображения экрана описания
    /// - Returns: данные для отображения экрана примера
    static func make(from viewData: DescriptionScreenView.ViewData) -> Self? {
        guard let example = viewData.example else { return nil }
        return .init(
            attributeTitle: viewData.qualityCharacteristic.title,
            context: example.context,
            task: example.task,
            defect: example.defect,
            defectScreenFactory: example.app.defectScreenFactory,
            standardAppScreenFactory: example.app.standardAppScreenFactory
        )
    }
}

extension SampleDescriptionScreenView.MetricaData {
    /// Адаптер данных метрики экрана атрибута в экран примера
    /// - Parameter metricaData: данные метрики экрана атрибута
    /// - Returns: данные метрики экрана примера
    static func make(from metricaData: DescriptionScreenView.MetricaData) -> Self {
        return .init(
            qualityCharacteristicName: metricaData.qualityCharacteristicName
        )
    }
}
