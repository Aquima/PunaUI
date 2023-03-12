//
//  PunaTooltipActionLinkHierarchy.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaTooltipActionBasicHierarchy: PunaButtonHierarchyProtocol {

    let idleColor: UIColor = .clear
    let pressedColor: UIColor
    let focusColor: UIColor = .clear
    let disableColor: UIColor = .clear
    let fontColor: UIColor
    let spinnerTintColor: UIColor = .clear

    init(textColor: UIColor, pressedColor: UIColor) {
        self.fontColor = textColor
        self.pressedColor = pressedColor
    }
}
