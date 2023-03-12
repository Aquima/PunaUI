//
//  PunaTextFieldCodeStateDisabled.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
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
