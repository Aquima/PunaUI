//
//  
//  PunaTabsTypeProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
