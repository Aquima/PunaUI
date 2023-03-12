//
//  PunaSeparatorStyleListView.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 26/10/20.
//

import Foundation

@objc public enum PunaSeparatorStyle: Int, PunaEnumStringConvertible {
    case none
    case singleLine

    public static func keyFor(_ value: PunaSeparatorStyle) -> String {
        switch value {
        case .none: return "NONE"
        case .singleLine: return "SINGLE_LINE"
        }
    }
}
