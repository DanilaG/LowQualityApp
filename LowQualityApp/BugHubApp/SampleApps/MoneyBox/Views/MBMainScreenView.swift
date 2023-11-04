//
//  MBMainScreenView.swift
//  BugHub
//
//  Created by Danila on 03.09.2023.
//

import SwiftUI

/// Основной экран приложения "Копилка"
struct MBMainScreenView<ViewModel: MBViewModel>: View {
    
    private typealias Strings = Localization.SampleApp.MoneyBox
    
    @Environment(\.dismiss) var dismiss
        
    @State private var showingSheet: Sheet?
    @State private var showingErrorAlert = false
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
        ZStack {
            if viewModel.loading {
                launchScreen
            } else {
                form
            }
        }
        .navigationTitle(Strings.title)
        .transaction { transaction in
            transaction.animation = nil
        }
        .onAppear {
            viewModel.onFatalError = {
                var transaction = Transaction()
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    dismiss()
                }
            }
        }
    }
    
    private var launchScreen: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            ProgressView()
        }
    }
        
    private var form: some View {
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
                // SwiftUI дважды вызывает init sheet если его навешать на форму
                // поэтому он внутри
                .sheet(item: $showingSheet) { data in makeSheet(data) }
                .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                .listRowBackground(Color.clear)
            Section(header: Text(Strings.actions)) {
                ButtonWitActionDelay(
                    Strings.TopUp.title,
                    delay: viewModel.actionResponseDelay,
                    action: {
                        if viewModel.blockActions {
                            showingErrorAlert = true
                        } else {
                            showingSheet = .topUp
                        }
                    }
                )
                if !viewModel.withoutWithdraw {
                    ButtonWitActionDelay(
                        Strings.Withdraw.title,
                        delay: viewModel.actionResponseDelay,
                        action: {
                            if viewModel.blockActions {
                                showingErrorAlert = true
                            } else {
                                showingSheet = .withdraw
                            }
                        }
                    )
                        .foregroundColor(.red)
                }
            }
            if !viewModel.history.isEmpty {
                Section(header: Text(Strings.history)) {
                    if viewModel.withoutCells {
                        noEffectiveHistory()
                    } else {
                        history()
                    }
                }
            }
        }
        .alert(isPresented: $showingErrorAlert) {
            Alert(title: Text(Strings.error), message: Text(Strings.Error.unavailable))
        }
    }
    
    private func history() -> some View {
        ForEach(viewModel.history) { item in
            switch viewModel.historyStyle {
            case .default:
                historyItem(for: item)
            case .noAccessible:
                noAccessibleHistoryItem(for: item)
            case .ugly:
                unethicalHistoryItem(for: item)
            }
        }
    }
    
    private func noEffectiveHistory() -> some View {
            ForEach(0..<viewModel.history.count, id: \.self) { index in
                Group {
                    historyItem(for: viewModel.history[index])
                        .padding(.trailing, 20)
                }
                .padding(.trailing, -20)
            }
    }
    
    private func historyItem(for item: MBTransactionViewModel) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.type.asString)
                Text(item.date)
                    .foregroundColor(Color(UIColor.secondaryLabel))
            }
            Spacer()
            Text(item.sum)
                .font(.title2)
                .foregroundColor(item.type == .topUp ? .green : .red)
        }
    }
    
    private func noAccessibleHistoryItem(for item: MBTransactionViewModel) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.type.asString)
                Text(item.date)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color(UIColor.quaternaryLabel))
            }
            Spacer()
            Text(item.sum)
                .font(.title2)
                .fontWeight(.light)
                .foregroundColor(Color(UIColor.quaternaryLabel))
        }
    }
    
    private func unethicalHistoryItem(for item: MBTransactionViewModel) -> some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text(item.type.asString)
                        .fontWeight(.bold)
                    Spacer()
                    Spacer()
                }
                HStack {
                    Spacer()
                    Spacer()
                    Text(item.date)
                        .fontWeight(.bold)
                }
            }
            Text(item.sum)
                .fontWeight(.bold)
            Spacer()
        }
    }
    
    private func makeSheet(_ sheet: Sheet) -> some View {
        MBSumAndDateForm(
            viewData: .init(
                title: sheet.title,
                hint: sheet.hint,
                actionTitle: sheet.actionTitle
            ),
            badQualityConfiguration: .init(
                actionDelay: { viewModel.actionResponseDelay },
                buttonAndKeyboardCoExistingFailure: viewModel.withKeyboardSafeAreaOffset,
                allowAutoKeyboardOpen: viewModel.openKeyboard,
                slimButton: viewModel.slimButtons
            ),
            action: { sheet.action(for: viewModel, with: $0) }
        )
            .ignoresSafeArea()
            .interactiveDismissDisabled()
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

/// Кнопка с задержкой по времени на действие
struct ButtonWitActionDelay: View {
    
    private let title: String
    private let delay: Duration?
    private let action: () -> Void
    
    /// Инициализатор кнопки с задержкой по времени на действие
    /// - Parameters:
    ///  - title: заголовок
    ///  - delay: время задержки
    ///  - action: действие по клику
    init(
        _ title: String,
        delay: Duration?,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.delay = delay
        self.action = action
    }
    
    var body: some View {
        Button(title) {
            guard let delay else {
                action()
                return
            }
            
            Task { @MainActor in
                try? await Task.sleep(for: delay)
                action()
            }
        }
    }
}

// MARK: - ErrorViewModel + Identifiable

extension ErrorViewModel: Identifiable {
    var id: String { title + (message ?? "") }
}

struct MBMainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MBMainScreenView(MBDefaultViewModel(model: MBModelWithData()))
    }
}

// MARK: - MBTransaction.`Type` + asString

fileprivate extension MBTransactionViewModel.`Type` {
    /// Представление типа в строке
    var asString: String {
        switch self {
        case .topUp:
            return Localization.SampleApp.MoneyBox.TopUp.title
        case .withdraw:
            return Localization.SampleApp.MoneyBox.Withdraw.title
        }
    }
}
