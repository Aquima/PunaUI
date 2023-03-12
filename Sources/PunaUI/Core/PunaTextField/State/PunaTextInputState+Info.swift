//
//  PunaTExtInputState+Info.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

extension PunaTextInputState {
    var accessibilityTraits: UIAccessibilityTraits {
        switch self {
        case .error, .warning, .idle:
            return .none
        case .disabled:
            return .notEnabled
        case .readOnly:
            return .staticText
        }
    }

    var accessibilityText: String? {
        switch self {
        case .error:
            return "Error".localized()
        case .warning:
            return "Advertencia".localized()
        default:
            return nil
        }
    }
}
