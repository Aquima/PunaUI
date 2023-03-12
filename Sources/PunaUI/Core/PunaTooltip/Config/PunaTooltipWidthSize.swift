//
//  PunaTooltipWidthSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaTooltipWidthSize: Int, PunaEnumStringConvertible {
    case dynamic
    case fullSize

    public static func keyFor(_ value: PunaTooltipWidthSize) -> String {
        switch value {
        case .dynamic: return "dynamic"
        case .fullSize: return "fullSize"
        }
    }
}
