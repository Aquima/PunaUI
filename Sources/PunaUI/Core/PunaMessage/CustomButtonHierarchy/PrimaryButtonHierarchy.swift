//
//  PrimaryButtonHierarchy.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/31/20.
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
