//
//  PunaTextFieldInputTrait.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaTextInputTraits: Int, PunaEnumStringConvertible {
    case password
    case email
    case numberPad
    case custom

    public static func keyFor(_ value: PunaTextInputTraits) -> String {
        switch value {
        case .email:
            return "EMAIL"
        case .numberPad:
            return "NUMBER_PAD"
        case .password:
            return "PASSWORD"
        case .custom:
            return "CUSTOM"
        }
    }
}
