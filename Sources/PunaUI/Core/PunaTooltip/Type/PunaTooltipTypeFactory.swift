//
//  
//  PunaTooltipTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
