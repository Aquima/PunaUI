//
//  PunaMoneyAmountAccesibilityManager.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
