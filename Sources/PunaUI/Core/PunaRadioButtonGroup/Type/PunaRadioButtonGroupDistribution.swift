//
//  PunaRadioButtonGroupDistribution.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaRadioButtonGroupDistribution: Int, PunaEnumStringConvertible {
    case horizontal
    case vertical

    public static func keyFor(_ value: PunaRadioButtonGroupDistribution) -> String {
        switch value {
        case .horizontal: return "HORIZONTAL"
        case .vertical: return "VERTICAL"
        }
    }
}
