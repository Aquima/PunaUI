//
//  PunaCardPaddingFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
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
