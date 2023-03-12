//
//  
//  PunaRadioButtonGroupTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaRadioButtonGroupTypeFactory {
    static func provide(_ type: PunaRadioButtonGroupDistribution) -> PunaRadioButtonGroupTypeProtocol {
        switch type {
        case .horizontal:
            return PunaRadioButtonGroupTypeHorizontal()
        case .vertical:
            return PunaRadioButtonGroupTypeVertical()
        }
    }
}
