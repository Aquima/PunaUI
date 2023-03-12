//
//  PunaCheckboxAlign.swift
//  PunaUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
/// Used to set the checkbox align
@objc public enum PunaCheckboxAlign: Int, PunaEnumStringConvertible {
    case left
    case right

    public static func keyFor(_ value: PunaCheckboxAlign) -> String {
        switch value {
        case .left: return "LEFT"
        case .right: return "RIGHT"
        }
    }
}
