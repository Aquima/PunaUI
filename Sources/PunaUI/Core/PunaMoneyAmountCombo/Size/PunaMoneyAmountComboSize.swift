//
//  PunaMoneyAmountComboSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// Used to define the size of an PunaMoneyAmountCombo
@objc public enum PunaMoneyAmountComboSize: Int, PunaEnumStringConvertible {
    case size24
    case size36

    public static func keyFor(_ value: PunaMoneyAmountComboSize) -> String {
        switch value {
        case .size24: return "24"
        case .size36: return "36"
        }
    }
}
