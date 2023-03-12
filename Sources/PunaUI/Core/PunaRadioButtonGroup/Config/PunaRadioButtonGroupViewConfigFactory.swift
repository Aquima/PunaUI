//
//  
//  PunaRadioButtonGroupViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaRadioButtonGroupViewConfigFactory {
    static func provideInternalConfig(distribution: PunaRadioButtonGroupDistribution, align: PunaRadioButtonAlign, selected: Int, radioButtons: [PunaRadioButtonItem]) -> PunaRadioButtonGroupViewConfig {

        let distribution = PunaRadioButtonGroupTypeFactory.provide(distribution)
        let radioButtons = PunaRadioButtonsGroupFactory.provide(radioButtons, with: align)

        let config = PunaRadioButtonGroupViewConfig(type: distribution, selected: selected, radioButtons: radioButtons)

        return config
    }
}
