//
//  PunaTagSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaTagSize: Int, PunaEnumStringConvertible {
    case small
    case large

    public static func keyFor(_ value: PunaTagSize) -> String {
        switch value {
        case .small:
            return "SMALL"
        case .large:
            return "LARGE"
        }
    }
}
