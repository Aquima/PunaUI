//
//  
//  PunaTabsTypeError.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 21/07/21.
//
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
