//
//  PunaBadgeType.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import Foundation
import UIKit

/// Used to define the colors of an PunaBadge
@objc public enum PunaBadgeType: Int, PunaEnumStringConvertible {
    case neutral
    case highlight
    case success
    case warning
    case error

    public static func keyFor(_ value: PunaBadgeType) -> String {
        switch value {
        case .neutral: return "NEUTRAL"
        case .highlight: return "HIGHLIGHT"
        case .success: return "SUCCESS"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        }
    }
}
