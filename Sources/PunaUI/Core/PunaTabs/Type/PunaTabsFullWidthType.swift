//
//  
//  PunaTabsTypeSuccess.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 21/07/21.
//
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
