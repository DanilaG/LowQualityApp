//
//  CallToScreenView.swift
//  BugHub
//
//  Created by Danila on 07.10.2023.
//

import SwiftUI

/// Экран для вызова по телефону
struct CallToScreenView: View {
    /// Данные для отображения
    struct ViewData {
        /// Заголовок
        let title: String
        /// Описание приложение
        let description: String
        /// Название кнопки
        let actionTitle: String
        /// URL для открытия по кнопке
        let url: URL?
    }
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text(viewData.title)
                .font(.largeTitle)
                .padding(.bottom, 4)
            Text(viewData.description)
                .multilineTextAlignment(.center)
            Spacer()
            Button(action: {
                guard let url = viewData.url else { return }
                openURL(url)
            }) {
                HStack {
                    Spacer()
                    Text(viewData.actionTitle)
                    Spacer()
                }.padding(.vertical, 4)
            }
                .buttonStyle(.borderedProminent)
            Spacer()
            Spacer()
        }
        .padding()
    }
    
    private let viewData: ViewData
    
    /// Инициализатор экрана вызова
    /// - Parameter viewData: данные для отображения
    init(
        viewData: ViewData
    ) {
        self.viewData = viewData
    }
}

struct CallToScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CallToScreenView(
            viewData: .init(
                title: "Моё приложение",
                description: "описание приложения",
                actionTitle: "Вызвать",
                url: URL(string: "tel:8005551212")
            )
        )
    }
}
