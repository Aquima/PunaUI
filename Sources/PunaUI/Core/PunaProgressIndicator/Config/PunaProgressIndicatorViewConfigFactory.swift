//
//  
//  PunaProgressIndicatorViewConfigFactory.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-20.
//
//

import Foundation
import UIKit

internal class PunaProgressIndicatorViewConfigFactory {
    static func provideInternalConfig(
        textColor: UIColor?,
        tint: UIColor?,
        label: String?,
        size: PunaProgressIndicatorSize) -> PunaProgressIndicatorViewConfig {

        let size = PunaProgressIndicatorSizeFactory.provideStyle(key: size)

        let config = PunaProgressIndicatorViewConfig(
            textColor: textColor,
            tint: tint,
            label: label,
            size: size
        )

        return config
    }
}
