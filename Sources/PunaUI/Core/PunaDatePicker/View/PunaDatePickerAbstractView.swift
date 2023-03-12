//
//  PunaDatePickerAbstractView.swift
//  PunaUI
//
//  Created by Ândriu Felipe Coelho on 08/11/20.
//

import Foundation
import UIKit

protocol PunaDatePickerAbstractViewDelegate: AnyObject {
    func didSelectDate(_ date: Date?, _ isConfirmed: Bool)
}

internal class PunaDatePickerAbstractView: UIView, PunaDatePickerView {

    // MARK: - IBOutlet

    @IBOutlet var datePickerView: UIView!
    @IBOutlet var datePickerCollectionView: UICollectionView!
    @IBOutlet var buttonPrimary: PunaButton!

    // Dynamic Constraints
    @IBOutlet weak var paddingToBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomButtonConstraint: NSLayoutConstraint!

    // MARK: - Attributes

    internal var backgroundLayer = CALayer()
    weak var delegate: PunaDatePickerAbstractViewDelegate?
    internal var dataCollectionView: PunaDatePickerSettingCollection?

    internal var selectedDate: Date? = Date() {
        didSet {
            if selectedDate != nil {
                lastSelectedDate = selectedDate
            }
        }
    }
    internal var lastSelectedDate: Date?
    private(set) var dayCalendar = PunaDayDatePicker()
    private var calendar = Calendar(identifier: .iso8601)
    private(set) lazy var daysToRender = dayCalendar.getDaysInMonth(Date(), nil)

    private(set) var baseDate: Date {
        didSet {
            daysToRender = dayCalendar.getDaysInMonth(baseDate, selectedDate)
            dataCollectionView?.days = daysToRender
            dataCollectionView?.currentDate = baseDate
            datePickerCollectionView.reloadData()
        }
    }

    override public var frame: CGRect {
        didSet {
            datePickerView?.frame = frame
        }
    }

    // MARK: - Instantiate

    internal init() {
        baseDate = Date()
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        baseDate = Date()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() { }

    // MARK: - Class methods

    func setDates(maxDate: Date?) {
        maxDate != nil ? setup() : ()
        dayCalendar = PunaDayDatePicker(endDate: maxDate)
        dayCalendar.delegate = self
        setupCollectionView()
        baseDate = Date()
    }

    func confirmButtonHidden(_ isHidden: Bool) {
        paddingToBottomConstraint.isActive = isHidden
        paddingTopButtonConstraint.isActive = !isHidden
        paddingBottomButtonConstraint.isActive = !isHidden
        paddingToBottomConstraint.constant = isHidden ? 10 : 0
        buttonPrimary.isHidden = isHidden
    }

    private func setup() {
        loadNib()
        datePickerView.layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerView)
        backgroundLayer = datePickerView.layer
        datePickerView.pinToSuperview()

        buttonPrimary.text = "Confirmar".localized()
        buttonPrimary.size = .large

        buttonPrimary.isEnabled = false
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        datePickerCollectionView.collectionViewLayout = layout
        datePickerCollectionView.isScrollEnabled = false

        dataCollectionView = PunaDatePickerSettingCollection(baseDate: Date(), daysToRender: daysToRender)
        dataCollectionView?.delegate = self
        datePickerCollectionView.dataSource = dataCollectionView
        datePickerCollectionView.delegate = dataCollectionView

        datePickerCollectionView.register(PunaDatePickerCell.self, forCellWithReuseIdentifier: PunaDatePickerCell.identifier)
        datePickerCollectionView.register(PunaDatePickerHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PunaDatePickerHeaderView")
    }

    // MARK: - IBAction

    @IBAction func didTouchConfirm(_ sender: PunaButton) {
        delegate?.didSelectDate(lastSelectedDate, true)
    }
}

extension PunaDatePickerAbstractView: PunaDatePickerSettingCollectionDelegate {
    func didSelectDate(_ date: Date?) {
        selectedDate = date
        buttonPrimary.isEnabled = true
        delegate?.didSelectDate(selectedDate, false)
    }

    func didTouchNextMonth() {
        baseDate = calendar.date(byAdding: .month, value: 1, to: baseDate) ?? baseDate
    }

    func didTouchPreviousMonth() {
        baseDate = calendar.date(byAdding: .month, value: -1, to: baseDate) ?? baseDate
    }
}

extension PunaDatePickerAbstractView: PunaDayDatePickerDelegate {
    func didSelectEnabledDay(_ day: Date?) {
        selectedDate = day
        buttonPrimary.isEnabled = true
    }
}
