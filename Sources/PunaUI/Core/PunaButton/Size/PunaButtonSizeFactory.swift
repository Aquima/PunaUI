//
//  PunaButtonSizeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/**
 The responsability of the factory is to provide the right size by providing the PunaButtonSize
 */
class PunaButtonSizeFactory {
    static func provideStyle(key: PunaButtonSize, icon: PunaButtonIcon?) -> PunaButtonSizeProtocol {
        switch key {
        case .large:
            return PunaButtonSizeLarge()
        case .medium:
            return PunaButtonSizeMedium()
        case .small:
            return PunaButtonSizeSmall()
        }
    }
}
