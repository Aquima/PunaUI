//
//  
//  PunaDiscount.swift
//  PunaUI
//
//  Created by Ana Cristina Calderon Castrillon on 1/09/21.
//
//

import Foundation
import UIKit

@objc public class PunaMoneyAmountDiscount: UIView, PunaAccessibleView {
    internal var contentView: PunaMoneyAmountDiscountView!

    @objc public var discountValue: Int = 0 {
        didSet {
            if discountValue < 0 {
                self.discountValue = abs(discountValue)
            }

            if discountValue > 100 {
                self.discountValue = 100
            }

            updateContentView()
        }
    }

    @objc public var size: PunaMoneyAmountSize = .size12 {
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

    @objc public init(discountValue: Int, size: PunaMoneyAmountSize) {
        super.init(frame: .zero)
        self.discountValue = discountValue
        self.size = size
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
        accessibilityManager = PunaMoneyAmountDiscountAccesibilityManager(view: self)
    }

    private func drawContentView(with newView: PunaMoneyAmountDiscountView) {
        self.contentView = newView
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func updateContentView() {
        let config = PunaMoneyAmountDiscountViewConfigFactory.provideInternalConfig(discountValue: discountValue, size: size)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which modifier is selected
    private func provideView() -> PunaMoneyAmountDiscountView {
        let config = PunaMoneyAmountDiscountViewConfigFactory.provideInternalConfig(discountValue: discountValue, size: size)
        return PunaMoneyAmountDiscountViewDefault(withConfig: config)
    }
}

// MARK: - IB interface
public extension PunaMoneyAmountDiscount {
    @IBInspectable var ibSize: String {
        set(val) {
            self.size = PunaMoneyAmountSize.checkValidEnum(property: "IB size", key: val)
        }
        get {
            return self.size.toString()
        }
    }

    @IBInspectable var ibDiscount: Int {
        set(val) {
            self.discountValue = val
        }
        get {
            return self.discountValue
        }
    }
}
