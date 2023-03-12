//
//  PunaTextFieldCodeStyle.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaTextFieldCodeStyle: Int, PunaEnumStringConvertible {

    case THREESOME
    case FOURSOME
    case THREE_BY_THREE

    public static func keyFor(_ value: PunaTextFieldCodeStyle) -> String {
        switch value {
        case .THREESOME:
            return "THREESOME"
        case .FOURSOME:
            return "FOURSOME"
        case .THREE_BY_THREE:
            return "THREE_BY_THREE"
        }
    }
}
