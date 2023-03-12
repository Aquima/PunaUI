//
//  PunaTextFieldStateWarning.swift
//  PunaUI
//
//  Created by Oscar Sierra Zuniga on 2/02/21.
//

import Foundation
import UIKit

struct PunaTextFieldStateWarning: PunaTextFieldStateProtocol {
    var borderColor = PunaStyleSheetManager.styleSheet.feedbackColorWarning
    var borderWidth: CGFloat = 1
    var borderDashed: Bool = false

    var labelTextColor = PunaStyleSheetManager.styleSheet.textColorWarning

    var helperColor = PunaStyleSheetManager.styleSheet.textColorWarning
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