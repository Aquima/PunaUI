//
//  PunaSliderTypeLimits.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

internal struct PunaSliderTypeLimits: PunaSliderTypeProtocol {
    var leftIcon: String = ""
    var rightIcon: String = ""
    var minValue: String
    var maxValue: String

    init(minValue: String, maxValue: String) {
        self.minValue = minValue
        self.maxValue = maxValue
    }
}
