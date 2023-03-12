//
//  PunaRadioButtonType.swift
//  PunaUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation

/// Used to set the radiobutton type
@objc public enum PunaRadioButtonType: Int, PunaEnumStringConvertible {
    case idle
    case disabled
    case error

    public static func keyFor(_ value: PunaRadioButtonType) -> String {
        switch value {
        case .idle: return "IDLE"
        case .disabled: return "DISABLED"
        case .error: return "ERROR"
        }
    }
}
