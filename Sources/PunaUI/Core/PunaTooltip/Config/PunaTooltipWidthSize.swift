//
//  PunaTooltipWidthSize.swift
//  PunaUI
//
//  Created by Vicente Veltri on 08/04/2021.
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
