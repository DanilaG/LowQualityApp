//
//  MBModelWithData.swift
//  LowQualityApp
//
//  Created by Danila on 03.09.2023.
//

import Foundation

/// Модель для приложения "Копилка" с изначальными данными
class MBModelWithData: MBDefaultModel {
    override init() {
        super.init()
        _ = topUp(sum: 2000, date: Date(timeIntervalSince1970: 1682494800))
        _ = topUp(sum: 1000, date: Date(timeIntervalSince1970: 1693724357))
    }
}
