//
//  PunaBadgeHierarchyFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
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
