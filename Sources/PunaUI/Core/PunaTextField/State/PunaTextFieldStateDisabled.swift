//
//  PunaTextFieldStateDisabled.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation
import UIKit

struct PunaTextFieldStateDisabled: PunaTextFieldStateProtocol {
    var borderColor = PunaStyleSheetManager.styleSheet.textColorDisabled
    var borderWidth: CGFloat = 1
    var borderDashed = true

    var labelTextColor = PunaStyleSheetManager.styleSheet.textColorDisabled

    var helperColor = PunaStyleSheetManager.styleSheet.textColorDisabled
    var helperIconTintColor: UIColor?
    var helperIconName: String?
    var helperSemibold: Bool = false

    var backgroundColor = UIColor.Puna.gray040
    var inputTextColor: UIColor = PunaStyleSheetManager.styleSheet.textColorDisabled
    var editingEnabled = false

    var placeholderTextColor = PunaStyleSheetManager.styleSheet.textColorSecondary
}
