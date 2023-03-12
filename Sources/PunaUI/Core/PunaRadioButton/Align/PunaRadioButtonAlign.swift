//
//  PunaRadioButtonAlign.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
// Used to set the radioButton align
@objc public enum PunaRadioButtonAlign: Int, PunaEnumStringConvertible {
    case left
    case right

    public static func keyFor(_ value: PunaRadioButtonAlign) -> String {
        switch value {
        case .left: return "LEFT"
        case .right: return "RIGHT"
        }
    }
}
