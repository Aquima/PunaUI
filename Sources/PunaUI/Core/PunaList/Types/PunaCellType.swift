//
//  PunaCellType.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

@objc public enum PunaCellType: Int, PunaEnumStringConvertible {
    case simple
    case chevron
    case radioButton
    case checkBox
    case timePicker

    public static func keyFor(_ value: PunaCellType) -> String {
        switch value {
        case .simple: return "SIMPLE"
        case .chevron: return "CHEVRON"
        case .radioButton: return "RADIOBUTTON"
        case .checkBox: return "CHECKBOX"
        case .timePicker: return "TIMEPICKER"
        }
    }
}
