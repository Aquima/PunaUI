//
//  
//  PunaSliderTypeSuccess.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaSliderTypeIcons: PunaSliderTypeProtocol {
    var leftIcon: String
    var rightIcon: String
    var minValue: String = ""
    var maxValue: String = ""

    init(leftIcon: String, rightIcon: String) {
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
    }
}
