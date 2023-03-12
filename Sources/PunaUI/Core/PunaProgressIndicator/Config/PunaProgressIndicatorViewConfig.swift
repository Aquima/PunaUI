//
//  
//  PunaProgressIndicatorViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/// used to define the ui of internal PunaProgressIndicator views
internal struct PunaProgressIndicatorViewConfig {

    var tint: UIColor?
    var textColor: UIColor?
    var label: String?
    var size: PunaProgressIndicatorSizeProtocol?

    init () {}

    init(
        textColor: UIColor?,
        tint: UIColor?,
        label: String?,
        size: PunaProgressIndicatorSizeProtocol?) {
        self.textColor = textColor
        self.tint = tint
        self.label = label
        self.size = size
    }
}
