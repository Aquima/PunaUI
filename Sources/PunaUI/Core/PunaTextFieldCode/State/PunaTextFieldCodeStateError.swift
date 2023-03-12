//
//  PunaTextFieldCodeStateError.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaTextFieldCodeStateError: PunaTextFieldCodeStateProtocol {
    var labelTextColor: UIColor = PunaStyleSheetManager.styleSheet.textColorNegative
    var helperTextColor: UIColor = PunaStyleSheetManager.styleSheet.textColorNegative
    var helperSemibold: Bool = true
    var helperIconName: String? = "Puna_ui_feedback_error_16"
    var helperIconTintColor: UIColor? = PunaStyleSheetManager.styleSheet.textColorWhite
    var helperIconBgColor: UIColor = PunaStyleSheetManager.styleSheet.textColorNegative
}
