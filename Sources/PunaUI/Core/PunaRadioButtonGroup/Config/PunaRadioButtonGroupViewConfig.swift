//
//  
//  PunaRadioButtonGroupViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// used to define the ui of internal PunaRadioButtonGroup views
struct PunaRadioButtonGroupViewConfig {
    var distribution: PunaRadioButtonGroupTypeProtocol
    var selected: Int
    var radioButtons: [PunaRadioButton]

    init() {
        distribution = PunaRadioButtonGroupTypeVertical()
        selected = -1
        radioButtons = []
    }

    init(type: PunaRadioButtonGroupTypeProtocol, selected: Int, radioButtons: [PunaRadioButton]) {
        self.distribution = type
        self.selected = selected
        self.radioButtons = radioButtons
    }
}
