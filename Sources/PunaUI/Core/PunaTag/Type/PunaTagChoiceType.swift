//
//  PunaTagChoiceType.swift
//  PunaUI
//
//  Created by Facundo Conil on 9/28/20.
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
