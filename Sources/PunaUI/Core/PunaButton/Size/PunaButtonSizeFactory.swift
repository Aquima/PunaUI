//
//  PunaButtonSizeFactory.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 02/01/2020.
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
