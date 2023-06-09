//
//  PunaTagType.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaTagType: Int, PunaEnumStringConvertible {
    case neutral
    case highlight
    case success
    case warning
    case error

    public static func keyFor(_ value: PunaTagType) -> String {
        switch value {
        case .neutral: return "NEUTRAL"
        case .highlight: return "HIGHLIGHT"
        case .success: return "SUCCESS"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        }
    }
}
