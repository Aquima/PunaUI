//
//  
//  PunaSliderTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaSliderTypeFactory {
    static func provide(_ type: PunaSliderType?, _ minValue: String, _ maxValue: String, leftIcon: String, rightIcon: String) -> PunaSliderTypeProtocol {
        switch type {
            case .simple:
                return PunaSliderTypeSimple()
            case .icons:
                return PunaSliderTypeIcons(leftIcon: leftIcon, rightIcon: rightIcon)
            case .limits:
                return PunaSliderTypeLimits(minValue: minValue, maxValue: maxValue)
            case .none:
                return PunaSliderTypeSimple()
        }
    }
}
