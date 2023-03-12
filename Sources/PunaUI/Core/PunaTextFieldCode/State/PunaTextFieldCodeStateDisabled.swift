//
//  PunaTextFieldCodeStateDisabled.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaTextFieldCodeStateDisabled: PunaTextFieldCodeStateProtocol {
    var labelTextColor: UIColor = PunaStyleSheetManager.styleSheet.textColorDisabled
    var helperTextColor: UIColor = PunaStyleSheetManager.styleSheet.textColorDisabled
    var helperSemibold: Bool = false
    var helperIconName: String?
    var helperIconTintColor: UIColor?
    var helperIconBgColor: UIColor = PunaStyleSheetManager.styleSheet.textColorDisabled
}
