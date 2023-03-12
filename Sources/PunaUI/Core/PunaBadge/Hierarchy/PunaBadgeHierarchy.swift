//
//  PunaBadgeHierarchy.swift
//  PunaUI
//

import Foundation

/// Used to define the style of an PunaBadge
@objc public enum PunaBadgeHierarchy: Int, PunaEnumStringConvertible {
    case loud
    case quiet

    public static func keyFor(_ value: PunaBadgeHierarchy) -> String {
        switch value {
        case .loud: return "LOUD"
        case .quiet: return "QUIET"
        }
    }
}
