//
//  PunaTextFieldComponentVisibility.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

@objc public enum PunaTextFieldComponentVisibility: Int, PunaEnumStringConvertible {
    case always
    case whenNotEmpty

    public static func keyFor(_ value: PunaTextFieldComponentVisibility) -> String {
        switch value {
        case .always: return "ALWAYS"
        case .whenNotEmpty: return "WHENNOTEMPTY"
        }
    }
}
