//
//  PunaTagChoiceTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaTagChoiceTypeFactory {
    static func provide(_ type: PunaTagChoiceType, forState state: PunaTagStateProtocol) -> PunaTagChoiceTypeProtocol {
        switch type {
        case .simple:
            return PunaTagChoiceTypeSimple(rightButtonImageName: state.rightButtonImageName)
        case .dropdown:
            return PunaTagChoiceTypeDropDown()
        }
    }
}
