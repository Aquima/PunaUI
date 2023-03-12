//
//  PunaLinearProgressIndicatorViewConfig.swift
//  PunaUI
//
//  Created by Jhon Alexander Ospino Bernal.
//

import Foundation
import UIKit

/// used to define the ui of internal PunaLinearProgressIndicator views
internal struct PunaLinearProgressIndicatorViewConfig {

    var indicatorTint: UIColor?
    var trackTint: UIColor?
    var isSplit: Bool?
    var numberOfSteps: Int?
    var size: PunaLinearProgressIndicatorSizeProtocol?

    init () {}

    init(
        indicatorTint: UIColor?,
        trackTint: UIColor?,
        isSplit: Bool?,
        numberOfSteps: Int?,
        size: PunaLinearProgressIndicatorSizeProtocol?) {
        self.indicatorTint = indicatorTint
        self.trackTint = trackTint
        self.isSplit = isSplit
        self.numberOfSteps = numberOfSteps
        self.size = size
    }
}
