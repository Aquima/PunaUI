//
//  
//  PunaTabsTypeSuccess.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaTabsFullWidthType: PunaTabsTypeProtocol {
    var currentSelection: Int = 0
    var distribution: UIStackView.Distribution = .fillEqually
    var textAlignment: NSTextAlignment = .left
    var widthPriority: UILayoutPriority = .defaultHigh
    var fullWidthTab: Bool = true
}
