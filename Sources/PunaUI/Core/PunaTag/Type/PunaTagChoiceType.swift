//
//  PunaTagChoiceType.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaTagChoiceType: Int, PunaEnumStringConvertible {
    case simple
    case dropdown

    public static func keyFor(_ value: PunaTagChoiceType) -> String {
        switch value {
        case .simple: return "SIMPLE"
        case .dropdown: return "DROPDOWN"
        }
    }
}
