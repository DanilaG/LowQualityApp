//
//  MBMainScreenView.swift
//  LowQualityApp
//
//  Created by Danila on 03.09.2023.
//

import SwiftUI

/// Основной экран приложения "Копилка"
struct MBMainScreenView<ViewModel: MBViewModel>: View {
    
    private typealias Strings = Localization.SampleApp.MoneyBox
        
    @State private var showingSheet: Sheet?
    @StateObject private var viewModel: ViewModel
        
    /// Инициализатор основного экрана приложения "Копилка"
    /// - Parameters:
    ///  - viewModel: view модель
    init(
        _ viewModel: ViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Form {
            Group {
                HStack(spacing: 0) {
                    Spacer()
                    VStack(alignment: .center, spacing: 0) {
                        Text(Strings.savings)
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Text(viewModel.sum)
                            .font(.largeTitle)
                            .foregroundColor(Color(UIColor.label))
                    }
                    Spacer()
                }
            }
                .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                .listRowBackground(Color.clear)
            Section(header: Text(Strings.actions)) {
                Button(Strings.TopUp.title, action: { showingSheet = .topUp })
                Button(Strings.Withdraw.title, action: { showingSheet = .withdraw })
                    .foregroundColor(.red)
            }
            if !viewModel.history.isEmpty {
                Section(header: Text(Strings.history)) {
                    ForEach(viewModel.history) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.type)
                                Text(item.date)
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            Spacer()
                            Text(item.sum)
                                .font(.title2)
                        }
                    }
                }
            }
        }
        .navigationTitle(Strings.title)
        .sheet(item: $showingSheet) { sheet in
            MBSumAndDateForm(
                viewData: .init(
                    title: sheet.title,
                    hint: sheet.hint,
                    actionTitle: sheet.actionTitle
                ),
                action: { sheet.action(for: viewModel, with: $0) }
            )
                .ignoresSafeArea()
                .interactiveDismissDisabled()
        }
    }
}

// MARK: - MBMainScreenView + Sheet

extension MBMainScreenView {
    /// Виды модальных представлений
    private enum Sheet: String, Identifiable {
        var id: String { rawValue }
        
        /// Заголовок окна
        var title: String {
            switch self {
            case .topUp:
                return Strings.TopUp.title
            case .withdraw:
                return Strings.Withdraw.title
            }
        }
        
        /// Подсказка ввода
        var hint: String {
            switch self {
            case .topUp:
                return Strings.TopUp.hint
            case .withdraw:
                return Strings.Withdraw.hint
            }
        }
        
        /// Название кнопки
        var actionTitle: String {
            switch self {
            case .topUp:
                return Strings.TopUp.action
            case .withdraw:
                return Strings.Withdraw.action
            }
        }
        
        @MainActor
        func action(for viewModel: ViewModel, with result: MBSumAndDateForm.Result) -> MBSumAndDateForm.ValidationError? {
            switch self {
            case .topUp:
                return viewModel.topUp(sum: result.sum ?? 0, date: result.date)?.asFormValidationError
            case .withdraw:
                return viewModel.withdraw(sum: result.sum ?? 0, date: result.date)?.asFormValidationError
            }
        }
        
        /// Пополнение
        case topUp
        /// Изъятие
        case withdraw
    }
}

// MARK: - ValidationErrorViewModel + asFormValidationError

fileprivate extension ValidationErrorViewModel {
    /// Представление в виде ошибок валидации формы
    var asFormValidationError: MBSumAndDateForm.ValidationError {
        .init(title: title, message: message)
    }
}

struct MBMainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MBMainScreenView(MBDefaultViewModel(model: MBModelWithData()))
    }
}
