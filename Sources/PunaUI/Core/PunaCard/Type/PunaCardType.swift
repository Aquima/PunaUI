//
//  PunaCardType.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/// Used to define the type of an PunaCard
@objc public enum PunaCardType: Int, PunaEnumStringConvertible {
    case none
    case highlight
    case error
    case success
    case warning

    public static func keyFor(_ value: PunaCardType) -> String {
        switch value {
        case .none: return "NONE"
        case .highlight: return "HIGHLIGHT"
        case .error: return "ERROR"
        case .success: return "SUCCESS"
        case .warning: return "WARNING"
        }
    }
}
