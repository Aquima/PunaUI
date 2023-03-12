//
//  PunaLinearProgressIndicatorSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation

/**
 The PunaLinearProgressIndicatorSize contains the differents sizes that a button supports
 */
@objc public enum PunaLinearProgressIndicatorSize: Int, PunaEnumStringConvertible {
    case large
    case small

    public static func keyFor(_ value: PunaLinearProgressIndicatorSize) -> String {
        switch value {
        case .large: return "LARGE"
        case .small: return "SMALL"
        }
    }
}
