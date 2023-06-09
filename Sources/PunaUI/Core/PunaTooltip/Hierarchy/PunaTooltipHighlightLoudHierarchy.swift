//
//  PunaTooltipHighlightLoudHierarchy.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaTooltipHighlightLoudHierarchy: PunaButtonHierarchyProtocol {
    let idleColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor600
    let pressedColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor300
    let focusColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor200
    let disableColor: UIColor = UIColor.Puna.gray100
    let fontColor: UIColor = PunaStyleSheetManager.styleSheet.textColorWhite
    let spinnerTintColor: UIColor = .clear
}
