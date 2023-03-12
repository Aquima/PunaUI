//
//  PunaCardStyle.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/// Used to define the style of an PunaCard
@objc public enum PunaCardStyle: Int, PunaEnumStringConvertible {
    case elevated
    case outline

    public static func keyFor(_ value: PunaCardStyle) -> String {
        switch value {
        case .elevated: return "ELEVATED"
        case .outline: return "OUTLINE"
        }
    }
}
