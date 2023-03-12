//
//  PunaSnackbarViewConfig.swift
//  PunaUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation
import UIKit

internal struct PunaSnackbarViewConfig {

    let text: String
    let backgroundColor: UIColor
    let actionConfig: PunaButtonViewConfig?

    init() {
        self.text = ""
        self.backgroundColor = UIColor.Puna.graySolid800
        self.actionConfig = nil
    }

    init(text: String, backgroundColor: UIColor, actionConfig: PunaButtonViewConfig? = nil) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.actionConfig = actionConfig
    }
}
