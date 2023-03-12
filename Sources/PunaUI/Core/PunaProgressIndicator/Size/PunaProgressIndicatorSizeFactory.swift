//
//  PunaProgressIndicatorSizeFactory.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-20.
//

import Foundation

/**
 The responsability of the factory is to provide the right size by providing the PunaProgressIndicatorSize
 */
class PunaProgressIndicatorSizeFactory {
    static func provideStyle(key: PunaProgressIndicatorSize) -> PunaProgressIndicatorSizeProtocol {
        switch key {
        case .large:
            return PunaProgressIndicatorSizeLarge()
        case .medium:
            return PunaProgressIndicatorSizeMedium()
        case .small:
            return PunaProgressIndicatorSizeSmall()
        case .xSmall:
            return PunaProgressIndicatorSizeXSmall()
        }
    }
}
