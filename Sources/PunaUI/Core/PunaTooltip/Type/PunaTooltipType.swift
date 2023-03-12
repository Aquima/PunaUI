//
//  
//  PunaTooltipType.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 19-01-21.
//
//

import Foundation

/// Used to define the colors of an PunaTooltip
@objc public enum PunaTooltipType: Int, PunaEnumStringConvertible {
    case light
    case dark
    case highlight

    public static func keyFor(_ value: PunaTooltipType) -> String {
        switch value {
        case .light: return "light"
        case .dark: return "dark"
        case .highlight: return "highlight"
        }
    }
}
