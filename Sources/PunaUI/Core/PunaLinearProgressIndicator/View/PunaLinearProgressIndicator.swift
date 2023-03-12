//
//  PunaLinearProgressDeterminate.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
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
