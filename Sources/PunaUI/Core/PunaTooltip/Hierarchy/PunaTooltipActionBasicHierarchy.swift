//
//  PunaTooltipActionLinkHierarchy.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 10-02-21.
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
