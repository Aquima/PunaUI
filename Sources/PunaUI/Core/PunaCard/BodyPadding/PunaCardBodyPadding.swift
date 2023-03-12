//
//  PunaCardBodyPadding.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/// Used to define the body padding of an PunaCard
@objc public enum PunaCardBodyPadding: Int, PunaEnumStringConvertible {
    case none
    case small
    case medium
    case large
    case xlarge

    public static func keyFor(_ value: PunaCardBodyPadding) -> String {
        switch value {
        case .none: return "NONE"
        case .small: return "SMALL"
        case .medium: return "MEDIUM"
        case .large: return "LARGE"
        case .xlarge: return "XLARGE"
        }
    }
}
