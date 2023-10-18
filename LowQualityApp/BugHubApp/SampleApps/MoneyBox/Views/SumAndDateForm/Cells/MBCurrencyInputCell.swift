//
//  MBCurrencyInputCell.swift
//  BugHub
//
//  Created by Danila on 05.09.2023.
//

import UIKit

/// Ячейка ввода валюты
final class MBCurrencyInputCell: UITableViewCell {
    
    /// Значение ячейки
    var value: Decimal? {
        textField.text.flatMap({ MBCurrencyInputCell.formatter.number(from: $0)?.decimalValue })
    }
    
    private static let formatter = {
        let formatter = NumberFormatters.MoneyInput()
        formatter.currencyCode = "USD"
        return formatter
    }()
    
    private let label = {
        let label = UILabel()
        label.text = Localization.SampleApp.MoneyBox.sum
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let textField = {
        let textField = UITextField()
        textField.textAlignment = .right
        textField.placeholder = formatter.string(from: 0)
        textField.keyboardType = UIKeyboardType.decimalPad
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return textField
    }()
    
    /// Инициализатор ячейки ввода суммы
    /// -  Parameters:
    ///  - style: стиль
    ///  - reuseIdentifier: индетификатор
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
    }
    
    private func setupSubviews() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor).isActive = true
        label.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        contentView.addSubview(textField)
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.inputAccessoryView = makeToolbar()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor).isActive = true
        textField.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let amountString = formateInput(textField.text) {
            textField.text = amountString
        }
    }
    
    private func formateInput(_ input: String?) -> String? {
        guard let input else { return nil }
        var number: NSNumber!
        var amountWithPrefix = input
    
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(
            in: amountWithPrefix,
            options: NSRegularExpression.MatchingOptions(rawValue: 0),
            range: NSMakeRange(0, input.count),
            withTemplate: ""
        )
    
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
    
        guard number != 0 as NSNumber else {
            return ""
        }
    
        return MBCurrencyInputCell.formatter.string(from: number)
    }
    
    private func makeToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(hideKeyboard))
        ]
        toolbar.sizeToFit()
        return toolbar
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
}
