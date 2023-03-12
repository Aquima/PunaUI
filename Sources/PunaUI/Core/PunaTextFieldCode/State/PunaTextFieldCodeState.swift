//
//  PunaTextFieldCodeState.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaTextFieldCodeState: Int, PunaEnumStringConvertible {

    case IDLE
    case ERROR
    case DISABLED

    public static func keyFor(_ value: PunaTextFieldCodeState) -> String {
        switch value {
        case .IDLE:
            return "IDLE"
        case .ERROR:
            return "ERROR"
        case .DISABLED:
            return "DISABLED"
        }
    }
}
