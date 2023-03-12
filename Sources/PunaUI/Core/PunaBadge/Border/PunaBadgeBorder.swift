//
//  PunaBadgeBorder.swift
//  PunaUI
//

import Foundation

/// Used to define the kind or border of an PunaBadge
@objc public enum PunaBadgeBorder: Int, PunaEnumStringConvertible {
    case standard
    case corner
    case rounded

    public static func keyFor(_ value: PunaBadgeBorder) -> String {
        switch value {
        case .standard: return "STANDARD"
        case .corner: return "CORNER"
        case .rounded: return "ROUNDED"
        }
    }
}
