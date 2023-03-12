//
//  PunaFloatingMenuNumberRow.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation

@objc public enum PunaFloatingMenuNumberRow: Int, PunaEnumStringConvertible, CaseIterable {
    public static func keyFor(_ value: PunaFloatingMenuNumberRow) -> String {
        switch value {
        case .small:
            return "SMALL"
        case .medium:
            return "MEDIUM"
        case .max:
            return "MAX"
        }
    }

    case small = 3
    case medium = 5
    case max = 50000 // OverflowNumber

}
