//
//  PunaCheckboxStatus.swift
//  PunaUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
/// Used to set the checkbox status
@objc public enum PunaCheckboxStatus: Int, PunaEnumStringConvertible {
    case selected
    case unselected
    case undefined

    public static func keyFor(_ value: PunaCheckboxStatus) -> String {
        switch value {
        case .selected: return "SELECTED"
        case .unselected: return "UNSELECTED"
        case .undefined: return "UNDEFINED"
        }
    }
}
