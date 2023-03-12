//
//  PunaFloatingOpenTypeHorizontal.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 22/06/2021.
//

import Foundation

@objc public enum  PunaFloatingOpenTypeHorizontal: Int, PunaEnumStringConvertible {

    public static func keyFor(_ value: PunaFloatingOpenTypeHorizontal) -> String {
        switch value {
        case .right:
            return "RIGHT"
        case .left:
            return "LEFT"
        }
    }

    case right
    case left
}
