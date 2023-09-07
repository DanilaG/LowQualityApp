//
//  DescriptionScreenView.swift
//  LowQualityApp
//
//  Created by Danila on 02.09.2023.
//

import SwiftUI

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
        }
        /// Описание примера
        struct Example {
            /// Описание приложения
            struct App {
                /// Название приложения
                let name: String
                /// Описание приложения
                let description: String
            }
            
            /// Описание приложения
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
    
    private typealias Strings = Localization.Description
    
    /// View data для экрана описания
    let viewData: ViewData

    @State private var showingApp = false
    
    var body: some View {
        Form {
            Section(header: Text(Strings.description)) {
                Text("**\(viewData.qualityCharacteristic.title)** - \(viewData.qualityCharacteristic.description)")
            }
            Section(
                header: Text(Strings.example),
                footer: Text(viewData.example.app.description)
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
                footer: Text(viewData.example.hint)
            ) {
                HStack {
                    Spacer()
                    Button(Strings.try, action: { showingApp = true })
                    Spacer()
                }
            }
            }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewData.qualityCharacteristic.title)
        .fullScreenCover(isPresented: $showingApp) {
            SampleAppViewWrapper {
                MBMainScreenView(MBDefaultViewModel(model: MBModelWithData()))
            }
        }
    }
}

struct DescriptionScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionScreenView(viewData: .init(
            qualityCharacteristic: .init(
                title: "Test",
                description: "degree to which a product or system can be used by people with the widest range of characteristics and capabilities to achieve a specified goal in a specified context of use."
            ),
            example: .init(
                app: .init(
                    name: "Копилка",
                    description: "Приложение для учёта накопленных денег"
                ),
                task: "Уменьшить баланс накопленных средств в приложении",
                hint: "В данной версии приложения вы не сможете уменьшить баланс, так как такой функционал отсутсвует"
            )
        ))
    }
}
