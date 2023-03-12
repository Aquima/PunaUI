//
//  PunaTextFieldStateError.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation
import UIKit

struct PunaTextFieldStateError: PunaTextFieldStateProtocol {
    var borderColor = PunaStyleSheetManager.styleSheet.feedbackColorNegative
    var borderWidth: CGFloat = 1
    var borderDashed: Bool = false

    var labelTextColor = PunaStyleSheetManager.styleSheet.textColorNegative

    var helperColor = PunaStyleSheetManager.styleSheet.textColorNegative
    var helperIconTintColor: UIColor? = PunaStyleSheetManager.styleSheet.textColorWhite
    var helperIconName: String? = "Puna_ui_feedback_error_16"
    var helperSemibold: Bool = true

    var backgroundColor = PunaStyleSheetManager.styleSheet.bgColorWhite
    var inputTextColor = PunaStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = true

    var placeholderTextColor = PunaStyleSheetManager.styleSheet.textColorSecondary

    init(focuesd: Bool) {
        if focuesd {
            backgroundColor = PunaStyleSheetManager.styleSheet.bgColorWhite
            borderWidth = 2
        }
    }
}
