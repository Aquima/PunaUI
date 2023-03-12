//
//  PunaCardPadding.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/// Used to define the padding of an PunaCard
@objc public enum PunaCardPadding: Int, PunaEnumStringConvertible {
    case none
    case small
    case medium
    case large
    case xlarge

    public static func keyFor(_ value: PunaCardPadding) -> String {
        switch value {
        case .none: return "NONE"
        case .small: return "SMALL"
        case .medium: return "MEDIUM"
        case .large: return "LARGE"
        case .xlarge: return "XLARGE"
        }
    }

    public func toPunaCardBodyPadding() -> PunaCardBodyPadding {
        switch self {
        case .none: return .none
        case .small: return .small
        case .medium: return .medium
        case .large: return .large
        case .xlarge: return .xlarge
        }
    }
}
