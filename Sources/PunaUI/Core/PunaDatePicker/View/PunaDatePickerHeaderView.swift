//
//  PunaDatePickerHeaderView.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/15/20.
//

import UIKit

protocol PunaDatePickerHeaderViewDelegate: AnyObject {
    func nextMonth()
    func previousMonth()
}

class PunaDatePickerHeaderView: UICollectionReusableView {

    enum DaysOfWeek: Int {
        case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    }

    // MARK: - Attributes

    static let identifier = String(describing: PunaDatePickerHeaderView.self)
    weak var delegate: PunaDatePickerHeaderViewDelegate?

    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale.autoupdatingCurrent
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM y")
        return dateFormatter
    }()

    var currentDate = Date() {
        didSet {
            monthLabel.text = dateFormatter.string(from: currentDate)
        }
    }

    // MARK: - UIComponents

    private let weekDaysStackView: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .center
        horizontalStack.distribution = .fillEqually
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false

        return horizontalStack
    }()

    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = PunaStyleSheetManager.styleSheet.textColorPrimary
        label.font = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 16.0)

        return label
    }()

    private(set) var previousButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(PunaDatePickerHeaderView.self, action: #selector(didTouchPreviousMonth), for: .touchUpInside)

        return button
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(PunaDatePickerHeaderView.self, action: #selector(didTouchNextMonth(_:)), for: .touchUpInside)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(weekDaysStackView)

        weekDaysStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        weekDaysStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        weekDaysStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true

        addSubview(monthLabel)
        monthLabel.bottomAnchor.constraint(equalTo: weekDaysStackView.topAnchor, constant: -20).isActive = true
        monthLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        addSubview(previousButton)
        PunaIconsProvider.loadIcon(name: PunaIcons.chevronLeft24) { icon in
            previousButton.setImage(icon.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        previousButton.centerYAnchor.constraint(equalTo: monthLabel.centerYAnchor).isActive = true
        previousButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        previousButton.widthAnchor.constraint(equalTo: previousButton.widthAnchor, constant: 24).isActive = true
        previousButton.heightAnchor.constraint(equalTo: previousButton.heightAnchor, constant: 24).isActive = true

        addSubview(nextButton)
        PunaIconsProvider.loadIcon(name: PunaIcons.chevronRight24) { icon in
            nextButton.setImage(icon.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        nextButton.centerYAnchor.constraint(equalTo: monthLabel.centerYAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8).isActive = true
        nextButton.widthAnchor.constraint(equalTo: previousButton.widthAnchor, constant: 24).isActive = true
        nextButton.heightAnchor.constraint(equalTo: previousButton.heightAnchor, constant: 24).isActive = true

        populateDaysOfWeek()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func populateDaysOfWeek() {
        for day in 1...7 {
            let label = UILabel()
            label.text = getDayOfWeek(number: day)
            label.textAlignment = .center
            label.font = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 10.0)
            label.textColor = PunaStyleSheetManager.styleSheet.textColorSecondary
            label.isAccessibilityElement = false

            weekDaysStackView.addArrangedSubview(label)
        }
    }

    private func getDayOfWeek(number: Int) -> String {
        switch DaysOfWeek(rawValue: number) {
        case .monday:
            return "SEG"
        case .tuesday:
            return "TER"
        case .wednesday:
            return "QUA"
        case .thursday:
            return "QUI"
        case .friday:
            return "SEX"
        case .saturday:
            return "SAB"
        case .sunday:
            return "DOM"
        default:
            return ""
        }
    }

    func togglePreviousButton(days: [PunaDayDatePicker], compareDate: Date? = nil) {
        previousButton.isEnabled = true
        for day in days {
            let datesAreInTheSameMonth = Calendar.current.isDate(day.date, equalTo: compareDate ?? Date(), toGranularity: .month)
            if datesAreInTheSameMonth && day.dueDate != nil {
                previousButton.isEnabled = false
                break
            }
        }
    }

    // MARK: - IBActions

    @objc func didTouchPreviousMonth(_ sender: UIButton) {
        delegate?.previousMonth()
    }

    @objc func didTouchNextMonth(_ sender: UIButton) {
        delegate?.nextMonth()
    }
}
