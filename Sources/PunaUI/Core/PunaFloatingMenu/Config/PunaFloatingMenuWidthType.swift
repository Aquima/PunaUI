//
//  PunaFloatingMenuWidthType.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 22/06/2021.
//

import Foundation

@objc public enum  PunaFloatingMenuWidthType: Int, PunaEnumStringConvertible, CaseIterable {

    public static func keyFor(_ value: PunaFloatingMenuWidthType) -> String {
        switch value {
        case .fixed:
            return "FIXED"
        case .custom:
            return "CUSTOM"
        }
    }

    case fixed
    case custom
}
