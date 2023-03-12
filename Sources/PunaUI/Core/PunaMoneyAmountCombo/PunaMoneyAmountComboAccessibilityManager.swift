//
//  
//  PunaMoneyAmountComboAccessibilityManager.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaMoneyAmountComboAccessibilityManager: PunaAccessibilityManager {
    private weak var view: PunaMoneyAmountCombo!

    required init(view: UIView) {
        guard let accessibleView = view as? PunaMoneyAmountCombo else {
            fatalError("PunaMoneyAmountCombo AccessibilityManager should recieve an PunaMoneyAmountCombo")
        }
        self.view = accessibleView
        viewUpdated()
    }

    func viewUpdated() {
        view.isAccessibilityElement = true
        view.accessibilityLabel = createAccessibilityLabel(moneyAmount: view)
    }

    func accessibilityActivated() {
        // not needed
    }

    private func createAccessibilityLabel(moneyAmount: PunaMoneyAmountCombo) -> String {
        guard let  content = moneyAmount.contentView as? PunaMoneyAmountComboAbstractView
              else { return " "}

        return "\(moneyAmountPrice(content: content)) \(moneyAmountDiscount(content: content)) \(moneyAmountPrevious(content: content))"
    }

    private func moneyAmountPrice(content: PunaMoneyAmountComboAbstractView) -> String {
        if let price = content.config.moneyAmount.accessibilityLabel {
            return "\("now".localized()): \(price), "
        }
        return ""
    }

    private func moneyAmountDiscount(content: PunaMoneyAmountComboAbstractView) -> String {
        if let moneyAmount = content.config.discount, let discount = moneyAmount.accessibilityLabel {
            return "\(discount), "
        }
        return ""
    }

    private func moneyAmountPrevious(content: PunaMoneyAmountComboAbstractView) -> String {
        if let moneyAmount = content.config.previous, let price = moneyAmount.accessibilityLabel {
            return "\(price)"
        }
        return ""
    }
}
