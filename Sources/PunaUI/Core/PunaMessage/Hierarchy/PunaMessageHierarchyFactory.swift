//
//  PunaMessageHierarchyFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

internal class PunaMessageHierarchyFactory {
    static func provide(_ hierarchy: PunaMessageHierarchy, forType type: PunaMessageTypeProtocol) -> PunaMessageHierarchyProtocol {
        switch hierarchy {
        case .loud:
            return PunaMessageHierarchyLoud(type: type)
        case .quiet:
            return PunaMessageHierarchyQuiet(type: type)
        }
    }
}
