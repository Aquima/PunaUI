//
//  
//  PunaTabsType.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 21/07/21.
//
//

import Foundation

@objc public enum PunaTabsType: Int, PunaEnumStringConvertible {
    case fullWidth
    case leftAlign

    public static func keyFor(_ value: PunaTabsType) -> String {
        switch value {
        case .fullWidth: return "FULL_WIDTH"
        case .leftAlign: return "LEFT_ALIGN"
        }
    }
}
