//
//  PunaBadgeType.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

@objc public enum PunaBadgeIconType: Int, PunaEnumStringConvertible {
    case accent
    case green
    case orange
    case red

    public static func keyFor(_ value: PunaBadgeIconType) -> String {
        switch value {
        case .accent: return "ACCENT"
        case .green: return "GREEN"
        case .orange: return "ORANGE"
        case .red: return "RED"
        }
    }

    func PunaBadgeType() -> PunaBadgeType {
        switch self {
        case .accent: return .highlight
        case .green: return .success
        case .orange: return .warning
        case .red: return .error
        }
    }
}
