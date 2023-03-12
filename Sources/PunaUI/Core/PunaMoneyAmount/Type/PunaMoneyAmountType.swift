//
//  
//  PunaMoneyAmountType.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// Used to define the type of an PunaMoneyAmount
@objc public enum PunaMoneyAmountType: Int, PunaEnumStringConvertible {
    case positive
    case negative
    case previous

    public static func keyFor(_ value: PunaMoneyAmountType) -> String {
        switch value {
        case .positive: return "POSITIVE"
        case .negative: return "NEGATIVE"
        case .previous: return "PREVIOUS"
        }
    }
}
