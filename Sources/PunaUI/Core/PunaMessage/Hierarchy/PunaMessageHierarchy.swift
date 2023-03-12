//
//  PunaMessageHierarchy.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
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
