//
//  PunaRadioButtonConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/// used to define the ui of internal PunaRadioButton views
internal struct PunaRadioButtonConfig {
    var title: String?
    var tintColor: UIColor?
    var textColor: UIColor!
    var align: PunaRadioButtonAlign = PunaRadioButtonAlign.left
    var type: PunaRadioButtonTypeProtocol! = PunaRadioButtonTypeIdle()
    var filled: Bool = false
    var titleNumberOfLines: Int?

    init () {

    }

    init(for radiobutton: PunaRadioButton) {
        self.title = radiobutton.title
        self.align = radiobutton.align
        self.type = PunaRadioButtonTypeFactory.provide(radiobutton.type, status: radiobutton.status)
        self.textColor = type.textColor
        self.tintColor = type.tintColor
        self.filled = radiobutton.status == .selected && radiobutton.type != .error
        self.titleNumberOfLines = radiobutton.titleNumberOfLines
    }
}
