//
//  PunaTextFieldStateReadonly.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaTextFieldStateReadonly: PunaTextFieldStateProtocol {
    var borderColor = UIColor.clear
    var borderWidth: CGFloat = 0
    var borderDashed: Bool = false

    var labelTextColor = PunaStyleSheetManager.styleSheet.textColorDisabled

    var helperColor = UIColor.clear
    var helperIconTintColor: UIColor?
    var helperIconName: String?
    var helperSemibold: Bool = false

    var backgroundColor = UIColor.clear
    var inputTextColor = PunaStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = false
    var placeholderTextColor = PunaStyleSheetManager.styleSheet.textColorDisabled
}
