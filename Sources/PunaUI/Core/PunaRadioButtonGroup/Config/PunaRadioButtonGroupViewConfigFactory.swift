//
//  
//  PunaRadioButtonGroupViewConfigFactory.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 10/06/21.
//
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
