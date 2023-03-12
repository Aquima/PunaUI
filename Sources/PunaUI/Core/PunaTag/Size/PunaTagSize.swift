//
//  PunaTagSize.swift
//  PunaUI
//
//  Created by Samuel Sainz on 5/27/20.
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
