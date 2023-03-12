//
//  PunaTooltipPosition.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaTooltipPosition: Int, PunaEnumStringConvertible {
    case top
    case bottom
    case left
    case right

    public static func keyFor(_ value: PunaTooltipPosition) -> String {
        switch value {
        case .top: return "top"
        case .bottom: return "bottom"
        case .left: return "left"
        case .right: return "right"
        }
    }
}
