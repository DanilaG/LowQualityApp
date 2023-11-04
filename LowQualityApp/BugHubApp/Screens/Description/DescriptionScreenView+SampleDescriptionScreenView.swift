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
    static func make(from viewData: DescriptionScreenView.ViewData) -> Self {
        return .init(
            attributeTitle: viewData.qualityCharacteristic.title,
            context: viewData.example.context,
            task: viewData.example.task,
            defect: viewData.example.defect,
            defectScreenFactory: viewData.example.app.defectScreenFactory,
            standardAppScreenFactory: viewData.example.app.standardAppScreenFactory
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
