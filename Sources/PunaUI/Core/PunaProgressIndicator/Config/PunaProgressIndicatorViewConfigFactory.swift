//
//  
//  PunaProgressIndicatorViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
