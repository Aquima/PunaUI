//
//  
//  PunaMoneyAmount.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public class PunaMoneyAmount: UIView, PunaAccessibleView {
    internal var contentView: PunaMoneyAmountView!
    var accessibilityManager: PunaAccessibilityManager?

    @objc public var size: PunaMoneyAmountSize = .size12 {
        didSet {
            updateContentView()
        }
    }

    @objc public var type: PunaMoneyAmountType = .positive {
        didSet {
            updateContentView()
        }
    }

    @objc public var currency: PunaMoneyAmountCurrency = .USD {
        didSet {
            updateContentView()
        }
    }

    /// This country variable is used if you want to give a specific format of a site 
    @objc public var country: PunaCountry = .DEFAULT {
        didSet {
            updateContentView()
        }
    }

    @objc public var decimalStyle: PunaMoneyAmountDecimalStyle = .normal {
        didSet {
            updateContentView()
        }
    }

    public var amount: Double? = nil {
        didSet {
            if let amount = amount, amount < 0 {
                self.type = .negative
            }

            updateContentView()
        }
    }

    @objc public var amountObjc: NSNumber? = nil {
        didSet {
            if let amountUnwraped = amountObjc as? Double {
                amount = amountUnwraped
            }
        }
    }

    /// adds two zeros in the decimal part of the number ejm: 123.00
    @objc public var showZerosDecimal: Bool = false {
        didSet {
            updateContentView()
        }
    }

    public static func currencyId(_ value: String) -> PunaMoneyAmountCurrency? {
        PunaMoneyAmountCurrency.init(value)
    }

    func moneyAmountCurrencyInfo(for currency: PunaMoneyAmountCurrency, and country: PunaCountry) -> PunaCurrencyInfo? {
        guard  let currencyInfo = PunaCurrenciesManager.currencies.currencies[currency.toString()] else { return nil}

        return currencyInfo.currencyInfoWith(formatedCountry: country)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(type: PunaMoneyAmountType) {
        super.init(frame: .zero)
        self.type = type
        setup()
    }

    public init(type: PunaMoneyAmountType, size: PunaMoneyAmountSize, currency: PunaMoneyAmountCurrency, decimalStyle: PunaMoneyAmountDecimalStyle, amount: Double?) {
        super.init(frame: .zero)
        self.type = type
        self.size = size
        self.currency = currency
        self.decimalStyle = decimalStyle
        self.amount = amount
        setup()
    }

    @objc public init(type: PunaMoneyAmountType, size: PunaMoneyAmountSize, currency: PunaMoneyAmountCurrency, decimalStyle: PunaMoneyAmountDecimalStyle, amountObjc: NSNumber?) {
        super.init(frame: .zero)
        self.type = type
        self.size = size
        self.currency = currency
        self.decimalStyle = decimalStyle
        self.amountObjc = amountObjc
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
        accessibilityManager = PunaMoneyAmountAccessibilityManager(view: self)
    }

    private func drawContentView(with newView: PunaMoneyAmountView) {
        self.contentView = newView
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    @objc public func setAmountValue(intValue: Int, cents: Int) {
        guard let doubleValue = Double("\(intValue).\(cents)") else { return }
        amount = doubleValue
    }

    private func updateContentView() {
        guard let currencyInfo = moneyAmountCurrencyInfo(for: currency, and: country) else { return }

        let config = PunaMoneyAmountViewConfigFactory.provideInternalConfig(type: type, currencyInfo: currencyInfo, size: size, decimalStyle: decimalStyle, amount: amount, showZerosDecimal: showZerosDecimal)
        contentView.update(withConfig: config)
        accessibilityManager?.viewUpdated()
    }

    /// Should return a view depending on which modifier is selected
    private func provideView() -> PunaMoneyAmountView {
        guard let currencyInfo = moneyAmountCurrencyInfo(for: currency, and: country) else { return PunaMoneyAmountViewDefault(withConfig: PunaMoneyAmountViewConfig()) }

        let config = PunaMoneyAmountViewConfigFactory.provideInternalConfig(type: type, currencyInfo: currencyInfo, size: size, decimalStyle: decimalStyle, amount: amount, showZerosDecimal: showZerosDecimal)
        return PunaMoneyAmountViewDefault(withConfig: config)
    }
}

// MARK: - IB interface
public extension PunaMoneyAmount {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = PunaMoneyAmountType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @IBInspectable var ibSize: String {
        set(val) {
            self.size = PunaMoneyAmountSize.checkValidEnum(property: "IB size", key: val)
        }
        get {
            return self.size.toString()
        }
    }

    @IBInspectable var ibCurrency: String {
        set(val) {
            self.currency = PunaMoneyAmountCurrency.checkValidEnum(property: "IB currency", key: val)
        }
        get {
            return self.currency.toString()
        }
    }

    @IBInspectable var ibDecimalStyle: String {
        set(val) {
            self.decimalStyle = PunaMoneyAmountDecimalStyle.checkValidEnum(property: "IB decimal Style", key: val)
        }
        get {
            return self.decimalStyle.toString()
        }
    }

    @IBInspectable var ibAmount: Double {
        set(val) {
            self.amount = val
        }
        get {
            return self.amount ?? 0.0
        }
    }
}
