//
//  PunaTextFieldCodeStateIdle.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
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
