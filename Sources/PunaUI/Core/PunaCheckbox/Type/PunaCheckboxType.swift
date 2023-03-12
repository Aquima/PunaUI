//
//  PunaCheckboxType.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/16/20.
//

import Foundation
/// Used to set the checkbox type
@objc public enum PunaCheckboxType: Int, PunaEnumStringConvertible {
    case idle
    case disabled
    case error

    public static func keyFor(_ value: PunaCheckboxType) -> String {
        switch value {
        case .idle: return "IDLE"
        case .disabled: return "DISABLED"
        case .error: return "ERROR"
        }
    }
}
