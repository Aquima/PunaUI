//
//  
//  PunaTooltipTypeFactory.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 19-01-21.
//
//

import Foundation

class PunaTooltipTypeFactory {
    static func provide(_ type: PunaTooltipType) -> PunaTooltipTypeProtocol {
        switch type {
        case .light:
            return PunaTooltipTypeLight()
        case .dark:
            return PunaTooltipTypeDark()
        case .highlight:
            return PunaTooltipTypeHighlight()
        }
    }
}
