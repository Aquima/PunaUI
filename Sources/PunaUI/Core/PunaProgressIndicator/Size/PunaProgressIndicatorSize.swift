//
//  PunaProgressIndicatorSize.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-20.
//

import Foundation

/**
 The PunaProgressIndicatorSize contains the different sizes that a button supports
 */
@objc public enum PunaProgressIndicatorSize: Int, PunaEnumStringConvertible {
    case large
    case medium
    case small
    case xSmall

    public static func keyFor(_ value: PunaProgressIndicatorSize) -> String {
        switch value {
        case .large: return "LARGE"
        case .medium: return "MEDIUM"
        case .small: return "SMALL"
        case .xSmall: return "XSMALL"
        }
    }
}
