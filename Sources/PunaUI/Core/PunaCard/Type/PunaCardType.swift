//
//  PunaCardType.swift
//  PunaUI
//
//  Created by Martin Victory on 13/07/2020.
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
