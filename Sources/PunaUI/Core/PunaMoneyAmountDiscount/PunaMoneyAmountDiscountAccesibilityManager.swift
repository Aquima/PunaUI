//
//  PunaMoneyAmountAccesibilityManager.swift
//  PunaUI
//
//  Created by Ana Cristina Calderon Castrillon on 6/09/21.
//

import Foundation
import UIKit

class PunaMoneyAmountDiscountAccesibilityManager: PunaAccessibilityManager {
    private weak var view: PunaMoneyAmountDiscount!

    required init(view: UIView) {
        guard let accessibleView = view as? PunaMoneyAmountDiscount else {
            fatalError("PunaMoneyAmountDiscount AccessibilityManager should recieve an PunaMoneyAmountDiscount")
        }
        self.view = accessibleView
        viewUpdated()
    }

    func viewUpdated() {
        view.isAccessibilityElement = true
        view.accessibilityLabel = "\(view.discountValue)% " + "OFF".localized()
    }

    func accessibilityActivated() {
        // not needed
    }
}
