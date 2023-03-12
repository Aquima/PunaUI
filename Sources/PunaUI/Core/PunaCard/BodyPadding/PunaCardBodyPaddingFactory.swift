//
//  PunaCardBodyPaddingFactory.swift
//  PunaUI
//
//  Created by Federico Gabriel Nosmor on 19/11/2020.
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
