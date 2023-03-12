//
//  PunaLinearProgressIndicatorSizeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
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
