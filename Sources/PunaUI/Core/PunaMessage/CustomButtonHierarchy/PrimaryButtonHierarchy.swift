//
//  PrimaryButtonHierarchy.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

struct PrimaryMessageActionButtonHierarchy: PunaButtonHierarchyProtocol {
    var idleColor: UIColor

    var pressedColor: UIColor

    var disableColor: UIColor  = UIColor.Puna.gray100

    var fontColor: UIColor = PunaStyleSheetManager.styleSheet.textColorWhite

    var spinnerTintColor: UIColor = .clear

    init(backgroundColor: UIColor, pressedColor: UIColor) {
        self.idleColor = backgroundColor
        self.pressedColor = pressedColor
    }
}
