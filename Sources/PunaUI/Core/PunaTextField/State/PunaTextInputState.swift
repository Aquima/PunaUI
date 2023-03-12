//
//  PunaTextFieldState.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// Used to define the colors of an PunaTextField
@objc public enum PunaTextInputState: Int, PunaEnumStringConvertible {
    case idle
    case error
    case disabled
    case readOnly
    case warning

    public static func keyFor(_ value: PunaTextInputState) -> String {
        switch value {
        case .idle: return "IDLE"
        case .error: return "ERROR"
        case .readOnly: return "READONLY"
        case .disabled: return "DISABLED"
        case .warning: return "WARNING"
        }
    }

}
