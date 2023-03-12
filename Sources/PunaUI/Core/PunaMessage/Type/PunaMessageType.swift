//
//  PunaMessageType.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/13/20.
//

import Foundation

/// Used to define the colors of an PunaMessage
@objc public enum PunaMessageType: Int, PunaEnumStringConvertible {
    case neutral
    case success
    case warning
    case error

    public static func keyFor(_ value: PunaMessageType) -> String {
        switch value {
        case .neutral: return "NEUTRAL"
        case .success: return "SUCCESS"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        }
    }
}
