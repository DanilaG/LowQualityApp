//
//  MBSumAndDateForm.swift
//  LowQualityApp
//
//  Created by Danila on 03.09.2023.
//

import SwiftUI
import UIKit

/// Форма ввода суммы и даты
struct MBSumAndDateForm: UIViewControllerRepresentable {
    
    /// Подкопотный view controller
    typealias UIViewControllerType = UINavigationController
    /// View данные
    typealias ViewData = MBSumAndDateFormViewController.ViewData
    /// Конфигурация для ухудшения качества
    typealias BadQualityConfiguration = MBSumAndDateFormViewController.BadQualityConfiguration
    /// Результат работы формы
    typealias Result = MBSumAndDateFormViewController.Result
    /// Ошибка валидации
    typealias ValidationError = MBSumAndDateFormViewController.ValidationError
    /// Действие по нажатию на кнопку. В случае возвращения `nil` форма закрывается
    /// - Parameter result: значения в форме
    /// - Returns: ошибки валидации
    typealias Action = MBSumAndDateFormViewController.Action
    
    private let viewData: ViewData
    private let badQualityConfiguration: BadQualityConfiguration
    private let action: Action
    
    /// Инициализатор форма ввода суммы и даты
    /// - Parameters:
    ///   - viewData: view данные
    ///   - badQualityConfiguration: конфигурации для ухудшения качества
    ///   - action: callback для завершения формы
    init(
        viewData: ViewData,
        badQualityConfiguration: BadQualityConfiguration,
        action: @escaping Action
    ) {
        self.viewData = viewData
        self.badQualityConfiguration = badQualityConfiguration
        self.action = action
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let vc = UINavigationController(
            rootViewController: MBSumAndDateFormViewController(
                viewData: viewData,
                badQualityConfiguration: badQualityConfiguration,
                action: action
            )
        )
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}

/// View controller формы для получения суммы и даты
final class MBSumAndDateFormViewController: UIViewController {
    
    /// View данные
    struct ViewData {
        /// Заголовок формы
        var title: String
        /// Сообщение подсказки внизу блока
        var hint: String
        /// Название кнопки завершения
        var actionTitle: String
    }
    
    /// Конфигурация для ухудшения качества
    struct BadQualityConfiguration {
        /// Время задержки ответа кнопок
        var actionDelay: () -> Duration?
        /// Нарушено сосуществование виртуальной клавиатуры и кнопки
        var buttonAndKeyboardCoExistingFailure: Bool
    }
    
    /// Результат работы формы
    struct Result {
        /// Сумма
        let sum: Decimal?
        /// Дата
        let date: Date
    }
    
    /// Ошибка валидации
    struct ValidationError {
        /// Заголовок
        let title: String
        /// Описание
        let message: String
    }
    
    /// Действие по нажатию на кнопку. В случае возвращения `nil` форма закрывается
    /// - Parameter result: значения в форме
    /// - Returns: ошибки валидации
    typealias Action = @MainActor (Result) -> ValidationError?
    
    private enum Const {
        static let bottomOffset: CGFloat = 8
        typealias Strings = Localization.SampleApp.MoneyBox
    }
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let sumCell = MBCurrencyInputCell()
    private let dateCell = MBDateInputCell()
    private let button = UIButton(configuration: .filled())
    
    /// View данные
    private let viewData: ViewData
    /// Конфигурация для ухудшения качества
    private let badQualityConfiguration: BadQualityConfiguration
    /// Действие по нажатию на кнопку
    private let action: Action
    
    /// Constraint нижнего отступа
    private var bottomConstraint: NSLayoutConstraint?
    /// True если клавиатура скрыта полностью
    private var isKeyboardHidden = true
    /// True если закрыть view после клавиатуры
    private var dismissViewAfterHideKeyboard = false
    /// Таска для задержки действия
    private var actionDelayTask: Task<Void, Never>?
    
    /// Инициализатор view controller-а
    /// - Parameters:
    ///  - viewData: view данные
    ///  - badQualityConfiguration: конфигурации для ухудшения качества
    ///  - action: действие по нажатию на кнопку
    init(
        viewData: ViewData,
        badQualityConfiguration: BadQualityConfiguration,
        action: @escaping Action
    ) {
        self.viewData = viewData
        self.badQualityConfiguration = badQualityConfiguration
        self.action = action
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewData.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel, target: self, action: #selector(dismissForm)
        )
        view.backgroundColor = UIColor.systemGroupedBackground
        
        keyboardSubscription()
        addKeyboardHiding()
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sumCell.becomeFirstResponder()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.addSubview(button)
        button.setTitle(viewData.actionTitle, for: .normal)
        button.addTarget(self, action: #selector(didButtonTab), for: [.touchUpInside, .touchUpOutside])
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        bottomConstraint = button.bottomAnchor
            .constraint(
                equalTo: view.keyboardLayoutGuide.topAnchor,
                constant: (badQualityConfiguration.buttonAndKeyboardCoExistingFailure ? 2 : -1)  * Const.bottomOffset
            )
        bottomConstraint?.isActive = true
        button.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc private func didButtonTab() {
        guard actionDelayTask == nil else { return }
        guard let delay = badQualityConfiguration.actionDelay() else {
            buttonAction()
            return
        }
        actionDelayTask = Task { @MainActor in
            try? await Task.sleep(for: delay)
            buttonAction()
        }
    }
    
    private func buttonAction() {
        actionDelayTask = nil
        if let error = action(
            .init(sum: sumCell.value, date: dateCell.value)
        ) {
            show(error: error)
        } else {
            dismissForm()
        }
    }
    
    @objc private func dismissForm() {
        guard actionDelayTask == nil else { return }
        guard isKeyboardHidden else {
            dismissViewAfterHideKeyboard = true
            hideKeyboard()
            return
        }
        bottomConstraint?.isActive = false
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Const.bottomOffset)
            .isActive = true
        dismiss(animated: true)
    }
    
    private func show(error: ValidationError) {
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Const.Strings.SumForm.Alert.ok, style: .default))
        present(alert, animated: true)
    }
    
    private func getCell(for indexPath: IndexPath) -> UITableViewCell? {
        switch indexPath.row {
        case 0:
            return sumCell
        case 1:
            return dateCell
        default:
            return nil
        }
    }
}

// MARK: - UITableViewDelegate

extension MBSumAndDateFormViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getCell(for: indexPath)?.becomeFirstResponder()
    }
}

// MARK: - UITableViewDataSource

extension MBSumAndDateFormViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        getCell(for: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        viewData.hint
    }
}

// MARK: - Keyboard

extension MBSumAndDateFormViewController {
    private func keyboardSubscription() {
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(keyboardDidHide),
                name: UIResponder.keyboardDidHideNotification,
                object: nil
            )
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(keyboardWillShow),
                name: UIResponder.keyboardWillShowNotification,
                object: nil
            )
    }
    
    @objc private func keyboardDidHide() {
        isKeyboardHidden = true
        if dismissViewAfterHideKeyboard {
            dismissForm()
        }
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        isKeyboardHidden = false
    }
    
    private func addKeyboardHiding() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - UIGestureRecognizerDelegate

extension MBSumAndDateFormViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        touch.view?.isDescendant(of: sumCell) == false
    }
}
