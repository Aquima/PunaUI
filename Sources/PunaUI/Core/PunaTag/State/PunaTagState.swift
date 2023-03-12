//
//  PunaTagState.swift
//  PunaUI
//
//  Created by Facundo Conil on 9/28/20.
//

import Foundation

@objc public enum PunaTagState: Int, PunaEnumStringConvertible {
    case idle
    case selected

    public static func keyFor(_ value: PunaTagState) -> String {
        switch value {
        case .idle: return "IDLE"
        case .selected: return "SELECTED"
        }
    }
}
