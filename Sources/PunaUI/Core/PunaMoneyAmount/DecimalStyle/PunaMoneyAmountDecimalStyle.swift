//
//  PunaMoneyAmountDecimalStyle.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaMoneyAmountDecimalStyle: Int, PunaEnumStringConvertible {
    case none
    case normal
    case superScript
    public static func keyFor(_ value: PunaMoneyAmountDecimalStyle) -> String {
        switch value {
        case .none: return "NONE"
        case .normal: return "NORMAL"
        case .superScript: return "SUPERSCRIPT"
        }
    }
}
