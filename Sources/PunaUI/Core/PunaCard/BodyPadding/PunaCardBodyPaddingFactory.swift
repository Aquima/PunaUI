//
//  PunaCardBodyPaddingFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

internal class PunaCardBodyPaddingFactory {
    static func provide(_ padding: PunaCardBodyPadding) -> PunaCardBodyPaddingProtocol {
        switch padding {
        case .none:
            return PunaCardBodyPaddingNone()
        case .small:
            return PunaCardBodyPaddingSmall()
        case .medium:
            return PunaCardBodyPaddingMedium()
        case .large:
            return PunaCardBodyPaddingLarge()
        case .xlarge:
            return PunaCardBodyPaddingXLarge()
        }
    }
}
