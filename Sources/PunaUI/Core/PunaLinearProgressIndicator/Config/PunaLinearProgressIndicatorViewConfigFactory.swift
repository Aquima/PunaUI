//
//  PunaLinearProgressIndicatorViewConfigFactory.swift
//  PunaUI
//
//  Created by Jhon Alexander Ospino Bernal.
//

import Foundation
import UIKit

internal class PunaLinearProgressIndicatorViewConfigFactory {
    static func provideInternalConfig(
        indicatorTint: UIColor?,
        trackTint: UIColor?,
        isSplit: Bool?,
        numberOfSteps: Int?,
        size: PunaLinearProgressIndicatorSize) -> PunaLinearProgressIndicatorViewConfig {

        func resolveNumberOfSteps(numberOfSteps: Int?) -> Int {
            if let numberOfSteps = numberOfSteps, case  DefaultsLinearProgress.minNumberOfSteps...DefaultsLinearProgress.maxNumberOfSteps = numberOfSteps {
                return numberOfSteps
            } else {
                fatalError("numberOfSteps : Value between \(DefaultsLinearProgress.minNumberOfSteps) and \(DefaultsLinearProgress.maxNumberOfSteps)")
            }
        }

        let size = PunaLinearProgressIndicatorSizeFactory.provideStyle(key: size)
        let numberOfSteps = resolveNumberOfSteps(numberOfSteps: numberOfSteps)

        let config = PunaLinearProgressIndicatorViewConfig(
            indicatorTint: indicatorTint,
            trackTint: trackTint,
            isSplit: isSplit,
            numberOfSteps: numberOfSteps,
            size: size)

        return config
    }
}
