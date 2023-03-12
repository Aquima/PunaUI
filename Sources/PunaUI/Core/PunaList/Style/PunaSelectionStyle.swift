//
//  PunaSelectionStyle.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation

@objc public enum PunaSelectionStyle: Int, PunaEnumStringConvertible {
    case gray
    case blue
    case none
    case defaultStyle

    public static func keyFor(_ value: PunaSelectionStyle) -> String {
        switch value {
        case .none: return "none"
        case .gray: return "gray"
        case .blue: return "blue"
        case .defaultStyle: return "default"
        }
    }
}
