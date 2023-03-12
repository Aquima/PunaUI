//
//  PunaButtonAccessibilityManager.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

class PunaButtonAccessibilityManager: PunaAccessibilityManager {
    private weak var view: PunaButton!

    required init(view: UIView) {
        guard let accessibleView = view as? PunaButton else {
            fatalError("PunaButtonAccessibilityManager should recieve an PunaButton")
        }
        self.view = accessibleView
        viewUpdated()
    }

    func viewUpdated() {
        view.isAccessibilityElement = true
        view.accessibilityLabel = view.isSpinnerOn ? view.text + "inProgress".localized() : view.text
        updateViewTraits()
    }

    func accessibilityActivated() {
        if !view.isSpinnerOn && view.isEnabled {
            view.sendActions(for: .touchUpInside)
        }
    }

    private func updateViewTraits() {
        if view.isEnabled {
            view.accessibilityTraits = .button
        } else {
            view.accessibilityTraits.formUnion([.button, .notEnabled])
        }
    }
}
