//
//  PunaCardHierarchy.swift
//  PunaUI
//
//  Created by Martin Victory on 13/07/2020.
//

import Foundation

/// Used to define the hierarchy of an PunaCard
@objc public enum PunaCardHierarchy: Int, PunaEnumStringConvertible {
    case primary
    case secondary
    case secondaryDark

    public static func keyFor(_ value: PunaCardHierarchy) -> String {
        switch value {
        case .primary: return "PRIMARY"
        case .secondary: return "SECONDARY"
        case .secondaryDark: return "SECONDARY_DARK"
        }
    }
}
