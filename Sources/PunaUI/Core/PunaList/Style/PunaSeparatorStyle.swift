//
//  PunaSeparatorStyleListView.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
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
