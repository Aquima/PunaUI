//
//  PunaSnackbarType.swift
//  PunaUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation
import UIKit

/// Tags allow you to filter content using color-based categories. A color is defined for each type.
@objc public enum PunaSnackbarType: Int, PunaEnumStringConvertible {
    case neutral
    case success
    case error

    public static func keyFor(_ value: PunaSnackbarType) -> String {
        switch value {
        case .neutral:
            return "NEUTRAL"
        case .success:
            return "SUCCESS"
        case .error:
            return "ERROR"
        }
    }

    public func toColor() -> UIColor {
        switch self {
        case .neutral:
            return UIColor.Puna.graySolid800
        case .success:
            return UIColor.Puna.green500
        case .error:
            return UIColor.Puna.red500
        }
    }
}
