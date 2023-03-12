//
//  
//  PunaMoneyAmountCombo.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 6/09/21.
//
//

import Foundation
import UIKit

@objc public class PunaMoneyAmountCombo: UIView, PunaAccessibleView {
    internal var contentView: PunaMoneyAmountComboView!

    @objc public var price: Double = 0.0 {
        didSet {
            updateContentView()
        }
    }

    @objc public var currency: PunaMoneyAmountCurrency = .USD {
        didSet {
            updateContentView()
        }
    }

    @objc public var size: PunaMoneyAmountComboSize = .size24 {
        didSet {
            updateContentView()
        }
    }

    @objc public var discount: Int = 0 {
        didSet {
            updateContentView()
        }
    }

    public var previousPrice: Double? = nil {
        didSet {
            updateContentView()
        }
    }

    public var previousPriceObjc: NSNumber? = nil {
        didSet {
            if let previousPriceUnwraped = previousPriceObjc as? Double {
                previousPrice = previousPriceUnwraped
            }
        }
    }

    /// This country variable is used if you want to give a specific format of a site
    @objc public var country: PunaCountry = .DEFAULT {
        didSet {
            updateContentView()
        }
    }

    var accessibilityManager: PunaAccessibilityManager?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public init(price: Double, size: PunaMoneyAmountComboSize, previousPrice: Double?, discount: Int = 0, currency: PunaMoneyAmountCurrency = .USD) {
        super.init(frame: .zero)
        self.price = price
        self.size = size
        self.previousPrice = previousPrice
        self.discount = discount
        self.currency = currency
        setup()
    }

    @objc public init(price: Double, size: PunaMoneyAmountComboSize, previousPriceObjc: NSNumber?, discount: Int = 0, currency: PunaMoneyAmountCurrency = .USD) {
        super.init(frame: .zero)
        self.price = price
        self.size = size
        self.previousPriceObjc = previousPriceObjc
        self.discount = discount
        self.currency = currency
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
        accessibilityManager = PunaMoneyAmountComboAccessibilityManager(view: self)
    }

    private func drawContentView(with newView: PunaMoneyAmountComboView) {
        self.contentView = newView
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func updateContentView() {
        let config = PunaMoneyAmountComboViewConfigFactory.provideInternalConfig(size: size, price: price, discount: discount, previousPricePrice: previousPrice, currency: currency)
        contentView.update(withConfig: config)
        accessibilityManager?.viewUpdated()
    }

    /// Should return a view depending on which modifier is selected
    private func provideView() -> PunaMoneyAmountComboView {
        let config = PunaMoneyAmountComboViewConfigFactory.provideInternalConfig(size: size, price: price, discount: discount, previousPricePrice: previousPrice, currency: currency)
        return PunaMoneyAmountComboViewDefault(withConfig: config)
    }
}

// MARK: - IB interface
public extension PunaMoneyAmountCombo {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'size' instead.")
    @IBInspectable var ibSize: String {
        set(val) {
            self.size = PunaMoneyAmountComboSize.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.size.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'price' instead.")
    @IBInspectable var ibPrice: Double {
        set(val) {
            self.price = val
        }
        get {
            return self.price
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'currency' instead.")
    @IBInspectable var ibCurrency: String {
        set(val) {
            self.currency = PunaMoneyAmountCurrency.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.currency.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'discount' instead.")
    @IBInspectable var ibDiscount: Int {
        set(val) {
            self.discount = val
        }
        get {
            return self.discount
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'price' instead.")
    @IBInspectable var ibPreviousPrice: Double {
        set(val) {
            self.previousPrice = val
        }
        get {
            return self.previousPrice ?? 0.0
        }
    }
}
