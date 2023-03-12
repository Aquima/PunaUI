//
//  
//  PunaTabsTypeError.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaTabsLeftAlignType: PunaTabsTypeProtocol {
    var textAlignment: NSTextAlignment = .center
    var currentSelection: Int = 0
    var distribution: UIStackView.Distribution = .fill
    var widthPriority: UILayoutPriority = .defaultLow
    var fullWidthTab: Bool = false
}
