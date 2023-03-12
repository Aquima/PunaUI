//
//  PunaLinearProgressDeterminate.swift
//  PunaUI
//
//  Created by Jhon Alexander Ospino Bernal.
//

import Foundation
import UIKit

internal protocol PunaLinearProgressIndicator: UIView {

    var size: PunaLinearProgressIndicatorSize { get set }
    var indicatorTint: UIColor { get set }
    var trackTint: UIColor { get set }

    func setup(config: PunaLinearProgressIndicatorViewConfig)
    func updateView(config: PunaLinearProgressIndicatorViewConfig)
    func createConfig() -> PunaLinearProgressIndicatorViewConfig
}
