//
//  MBDateInputCell.swift
//  BugHub
//
//  Created by Danila on 05.09.2023.
//

import UIKit

/// Ячейка выбора даты
final class MBDateInputCell: UITableViewCell {
    
    /// Выбранная дата
    var value: Date {
        datePicker.date
    }
    
    private let label = {
        let label = UILabel()
        label.text = Localization.SampleApp.MoneyBox.date
        return label
    }()
    
    private let datePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        return datePicker
    }()
    
    /// Инициализатор ячейки выбора даты
    /// -  Parameters:
    ///  - style: стиль
    ///  - reuseIdentifier: индетификатор
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor).isActive = true
        label.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        contentView.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor).isActive = true
        datePicker.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        datePicker.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
}
