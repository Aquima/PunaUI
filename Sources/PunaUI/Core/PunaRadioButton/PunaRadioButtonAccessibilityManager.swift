//
//  PunaRadioButtonAccessibilityManager.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 5/08/21.
//

import Foundation
import UIKit

class PunaRadioButtonAccessibilityManager: PunaAccessibilityManager {
    private weak var view: PunaRadioButton!

    required init(view: UIView) {
        guard let radioButton = view as? PunaRadioButton else {
            fatalError("PunaRadioButtonAccessibilityManager should recieve an PunaRadioButton")
        }
        self.view = radioButton
        viewUpdated()
    }

    func viewUpdated() {
        view.isAccessibilityElement = true
        view.accessibilityLabel = createAccessibilityLabel(radioButton: view)
        view.accessibilityTraits = view.type != .disabled ? .none : .notEnabled
        view.accessibilityHint = radioButtonAccessibilityHint
    }

    func accessibilityActivated() {
        view.radioButtonTapped()
    }

    private func createAccessibilityLabel(radioButton: PunaRadioButton) -> String {
        var accessibilityLabel: String = ""
        accessibilityLabel += "\(radioButtonStatusAccessibilityText) \(radioButtonTitleAccessibilityText) \(radioButtonTypeAccessibilityText) \("Botón de selección".localized())"
        return accessibilityLabel
    }
}

extension PunaRadioButtonAccessibilityManager {
    var radioButtonTitleAccessibilityText: String {
        if let title = view.title {
            return title + ","
         }
         return ""
     }

    var radioButtonTypeAccessibilityText: String {
        view.type == .error ? "Error".localized() : ""
    }

    var radioButtonStatusAccessibilityText: String {
        switch view.status {
        case .selected:
            return "Marcado".localized()
        case .unselected:
            return "No Marcado".localized()
        }
    }

    var radioButtonAccessibilityHint: String {
        view.type != .disabled ? "Toque dos veces para alternar".localized() : ""
    }
}
