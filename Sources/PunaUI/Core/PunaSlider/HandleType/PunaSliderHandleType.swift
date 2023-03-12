//
//  PunaSliderHandleType.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
