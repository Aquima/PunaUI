//
//  
//  PunaSliderType.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// Used to define the colors of an PunaSlider
@objc public enum PunaSliderType: Int, PunaEnumStringConvertible {
    case simple
    case icons
    case limits

    public static func keyFor(_ value: PunaSliderType) -> String {
        switch value {
        case .simple: return "SIMPLE"
        case .icons: return "ICONS"
        case .limits: return "LIMITS"
        }
    }
}
