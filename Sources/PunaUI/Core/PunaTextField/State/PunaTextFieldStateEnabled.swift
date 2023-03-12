//
//  PunaTextFieldStateIdle.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaTextFieldStateIdle: PunaTextFieldStateProtocol {
    var borderColor = UIColor.Puna.gray250
    var borderWidth: CGFloat = 1
    var borderDashed = false

    var labelTextColor = PunaStyleSheetManager.styleSheet.textColorPrimary

    var helperColor = PunaStyleSheetManager.styleSheet.textColorSecondary
    var helperIconTintColor: UIColor? = PunaStyleSheetManager.styleSheet.textColorSecondary
    var helperIconName: String?
    var helperSemibold: Bool = false

    var backgroundColor = PunaStyleSheetManager.styleSheet.bgColorWhite
    var inputTextColor = PunaStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = true

    var placeholderTextColor = PunaStyleSheetManager.styleSheet.textColorSecondary

    init(focuesd: Bool) {
        if focuesd {
            borderColor = PunaStyleSheetManager.styleSheet.accentColor
            borderWidth = 2
        }
    }
}
