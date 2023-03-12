//
//  
//  PunaTabsViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

internal class PunaTabsViewConfigFactory {
    static func provideInternalConfig(PunaTabs: PunaTabs) -> PunaTabsViewConfig {
        let type = PunaTabsTypeFactory.provide(PunaTabs.type)
        let config = PunaTabsViewConfig(type: type,
                                         style: PunaTabsStyle(),
                                         widthConstraint: PunaTabs.bounds.width,
                                         tabsList: PunaTabs.tabs,
                                         currentSelection: PunaTabs.selectedTabPosition,
                                         fullWidthTab: type.fullWidthTab,
                                         dispatchQueue: PunaTabs.dispatchQueue)

        return config
    }
}
