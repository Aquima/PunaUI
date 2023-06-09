//
//  PunaRadioButtonTypeIdle.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

/// Handle radioButton Idle type
class PunaRadioButtonTypeIdle: PunaRadioButtonTypeProtocol {
    var tintColor: UIColor = UIColor.Puna.gray250
    var textColor: UIColor = PunaStyleSheetManager.styleSheet.textColorPrimary

    init() { }

    init(status: PunaRadioButtonStatus) {
        if status == .selected {
            self.tintColor = PunaStyleSheetManager.styleSheet.accentColor
        }
    }
}
