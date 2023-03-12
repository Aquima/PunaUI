//
//  PunaButtonStyle.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/**
The PunaButtonSize contains the differents styles that a button supports
*/
@objc public enum PunaButtonHierarchy: Int, PunaEnumStringConvertible {
    case loud
    case quiet
    case transparent

    public static func keyFor(_ value: PunaButtonHierarchy) -> String {
        switch value {
        case .loud: return "LOUD"
        case .quiet: return "QUIET"
        case .transparent: return "TRANSPARENT"
        }
    }
}
