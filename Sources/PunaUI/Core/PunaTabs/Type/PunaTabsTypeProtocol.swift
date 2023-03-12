//
//  
//  PunaTabsTypeProtocol.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 21/07/21.
//
//

import Foundation
import UIKit

internal protocol PunaTabsTypeProtocol {
    var currentSelection: Int { get }
    var distribution: UIStackView.Distribution { get }
    var textAlignment: NSTextAlignment { get }
    var widthPriority: UILayoutPriority { get }
    var fullWidthTab: Bool { get }
}
