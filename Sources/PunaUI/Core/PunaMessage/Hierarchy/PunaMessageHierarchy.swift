//
//  PunaMessageHierarchy.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/14/20.
//

import Foundation

/// Used to define the style of an PunaMessage
@objc public enum PunaMessageHierarchy: Int, PunaEnumStringConvertible {
    case loud
    case quiet

    public static func keyFor(_ value: PunaMessageHierarchy) -> String {
        switch value {
        case .loud: return "LOUD"
        case .quiet: return "QUIET"
        }
    }
}
