//
//  PunaTextFieldCodeState.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
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
