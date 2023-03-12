//
//  PunaSliderHandleType.swift
//  PunaUI
//
//  Created by Victor Chang on 29/04/2021.
//

import Foundation

@objc public enum PunaSliderHandleType: Int, PunaEnumStringConvertible {
    case singleType
    case rangeType

    public static func keyFor(_ value: PunaSliderHandleType) -> String {
        switch value {
            case .singleType: return "SINGLE_TYPE"
            case .rangeType: return "RANGE_TYPE"
        }
    }
}
