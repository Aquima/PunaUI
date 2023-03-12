//
//  PunaRadioButtonGroupDistribution.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 10/06/21.
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
