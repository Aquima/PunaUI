//
//  PunaTextFieldComponentVisibility.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
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
