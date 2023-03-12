//
//  PunaCheckboxTypeError.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/16/20.
//

import Foundation
import UIKit

// Handle checkbox error type
class PunaCheckboxTypeError: PunaCheckboxTypeProtocol {
    var borderColor: UIColor? = UIColor.Puna.red500
    var borderSize: CGFloat? = 2
    var textColor: UIColor = PunaStyleSheetManager.styleSheet.textColorPrimary
    var backgroundColor: UIColor = UIColor.Puna.white
    var iconColor: UIColor?
    var cornerRadius: CGFloat = 3
}
