//
//  
//  PunaMoneyAmountType.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 24/08/21.
//
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
