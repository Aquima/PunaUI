//
//  PunaDatePicker.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/15/20.
//

import UIKit

@objc public class PunaDatePicker: UIControl {

    // MARK: - Attributes

    internal var contentView: PunaDatePickerView
    private var datePickerView = PunaDatePickerDefaultView()
    internal var didTapped: ((_ selectedDate: Date?, _ isConfirmed: Bool) -> Void)?

    /// Date Picker: is a component of quick choice of dates
    /// - Parameters:
    ///   - maxDate: maximum date allowed to select a date (date after that it will not be allowed to select)
    ///   - callback: will return the selected date and if the confirmation button was pressed
    @objc public func setDatePickerDate(maxDate: Date? = nil, callback: @escaping ((_ selectedDate: Date?, _ isConfirmed: Bool) -> Void)) {
        self.didTapped = callback
        datePickerView.setDates(maxDate: maxDate)
    }

    /// - Parameters:
    ///   - isHidden: allows to hide the confirm button.
    @objc public func confirmButtonHidden(_ isHidden: Bool) {
        datePickerView.confirmButtonHidden(isHidden)
    }

    // MARK: - Initializer

    @objc public init() {
        contentView = datePickerView
        super.init(frame: .zero)
        setup()
        datePickerView.delegate = self
    }

    required init?(coder: NSCoder) {
        contentView = datePickerView
        super.init(coder: coder)
        setup()
        datePickerView.delegate = self
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.addSubview(contentView)
        contentView.pinToSuperview()
    }
}

/// Here we have 2 parameters:

/// 1) it's the selected date (can be null if the selected date is outside the allowed range)
/// 2) is the action of the confirm button (the user selected the date)

extension PunaDatePicker: PunaDatePickerAbstractViewDelegate {
    func didSelectDate(_ date: Date?, _ isConfirmed: Bool) {
        didTapped?(date, isConfirmed)
    }
}
