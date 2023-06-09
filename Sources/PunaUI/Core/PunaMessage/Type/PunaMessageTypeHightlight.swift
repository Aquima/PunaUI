//
//  PunaMessageTypeHightlight.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaMessageTypeHightlight: PunaMessageTypeProtocol {
    var primaryColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
    var secondaryColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor600
    var primaryButtonPressedColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor800
    var secondaryButtonPressedColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor700
    var linkButtonPressedColor: UIColor = .clear
    var icon: String = PunaIcons.feedbackInfo16
}
