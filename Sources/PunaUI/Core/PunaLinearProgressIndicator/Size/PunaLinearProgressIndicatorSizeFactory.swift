//
//  PunaLinearProgressIndicatorSizeFactory.swift
//  PunaUI
//
//  Created by Jhon Alexander Ospino Bernal.
//

import Foundation

/**
 The responsability of the factory is to provide the right size by providing the PunaLinearProgressIndicatorSize
 */
class PunaLinearProgressIndicatorSizeFactory {
    static func provideStyle(key: PunaLinearProgressIndicatorSize) -> PunaLinearProgressIndicatorSizeProtocol {
        switch key {
        case .large:
            return PunaLinearProgressIndicatorSizeLarge()
        case .small:
            return PunaLinearProgressIndicatorSizeSmall()
        }
    }
}
