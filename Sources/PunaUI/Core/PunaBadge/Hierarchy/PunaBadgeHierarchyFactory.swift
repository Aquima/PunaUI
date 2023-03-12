//
//  PunaBadgeHierarchyFactory.swift
//  PunaUI
//

import Foundation

internal class PunaBadgeHierarchyFactory {
    static func provide(_ hierarchy: PunaBadgeHierarchy, forType type: PunaBadgeTypeProtocol) -> PunaBadgeHierarchyProtocol {
        switch hierarchy {
        case .loud:
            return PunaBadgeHierarchyLoud(type: type)
        case .quiet:
            return PunaBadgeHierarchyQuiet(type: type)
        }
    }
}
