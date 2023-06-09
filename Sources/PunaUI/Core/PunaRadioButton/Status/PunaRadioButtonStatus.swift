//
//  PunaRadioButtonStatus.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
// Used to set the radiobutton status
@objc public enum PunaRadioButtonStatus: Int, PunaEnumStringConvertible {
    case selected
    case unselected

    public static func keyFor(_ value: PunaRadioButtonStatus) -> String {
        switch value {
        case .selected: return "SELECTED"
        case .unselected: return "UNSELECTED"
        }
    }
}
