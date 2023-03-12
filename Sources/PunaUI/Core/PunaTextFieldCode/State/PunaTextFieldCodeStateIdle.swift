//
//  PunaTextFieldCodeStateIdle.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaTextFieldCodeStateIdle: PunaTextFieldCodeStateProtocol {
    var labelTextColor: UIColor = PunaStyleSheetManager.styleSheet.textColorPrimary
    var helperTextColor: UIColor = PunaStyleSheetManager.styleSheet.textColorSecondary
    var helperSemibold: Bool = false
    var helperIconName: String?
    var helperIconTintColor: UIColor? = PunaStyleSheetManager.styleSheet.textColorSecondary
    var helperIconBgColor: UIColor = PunaStyleSheetManager.styleSheet.textColorSecondary
}
