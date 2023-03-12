//
//  PunaCardHierarchyFactory.swift
//  PunaUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal class PunaCardHierarchyFactory {
    static func provide(_ hierarchy: PunaCardHierarchy, forStyle style: PunaCardStyleProtocol, forType type: PunaCardTypeProtocol) -> PunaCardHierarchyProtocol {
        switch hierarchy {
        case .primary:
            return PunaCardHierarchyPrimary(style: style, type: type)
        case .secondary:
            return PunaCardHierarchySecondary()
        case .secondaryDark:
            return PunaCardHierarchySecondaryDark()
        }
    }
}
