//
//  PunaButtonSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/**
 The PunaButtonSize contains the differents sizes that a button supports
 */
@objc public enum PunaButtonSize: Int, PunaEnumStringConvertible {
    case large
    case medium
    case small

    public static func keyFor(_ value: PunaButtonSize) -> String {
        switch value {
        case .large: return "LARGE"
        case .medium: return "MEDIUM"
        case .small: return "SMALL"
        }
    }
}
