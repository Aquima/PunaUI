//
//  PunaCardPaddingFactory.swift
//  PunaUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal class PunaCardPaddingFactory {
    static func provide(_ padding: PunaCardPadding) -> PunaCardPaddingProtocol {
        switch padding {
        case .none:
            return PunaCardPaddingNone()
        case .small:
            return PunaCardPaddingSmall()
        case .medium:
            return PunaCardPaddingMedium()
        case .large:
            return PunaCardPaddingLarge()
        case .xlarge:
            return PunaCardPaddingXLarge()
        }
    }
}
