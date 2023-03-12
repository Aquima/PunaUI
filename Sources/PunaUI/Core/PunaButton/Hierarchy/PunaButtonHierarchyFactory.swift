//
//  PunaButtonStyleFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/**
The responsability of the factory is to provide the right style by providing the PunaButtonSize
*/
class PunaButtonHierarchyFactory {
    static func provideStyle(key: PunaButtonHierarchy) -> PunaButtonHierarchyProtocol {
        switch key {
        case .loud:
            return PunaButtonHierarchyLoud()
        case .quiet:
            return PunaButtonHierarchyQuiet()
        case .transparent:
            return PunaButtonHierarchyTransparent()
        }

    }

}
