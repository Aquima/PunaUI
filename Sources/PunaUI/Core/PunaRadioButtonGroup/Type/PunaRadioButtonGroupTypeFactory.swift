//
//  
//  PunaRadioButtonGroupTypeFactory.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 10/06/21.
//
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
