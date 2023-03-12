//
//  
//  PunaTabsViewConfig.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 21/07/21.
//
//

import Foundation
import UIKit

struct PunaTabsViewConfig {
    var currentSelection: Int = 0
    var distribution: UIStackView.Distribution = .fill
    var textAlignment: NSTextAlignment = .center
    var widthPriority: UILayoutPriority = .required
    var style: PunaTabsStyle = PunaTabsStyle()
    var widthConstraint: CGFloat = UIScreen.main.bounds.width
    var fullWidthTab: Bool = true
    var tabsList: [PunaTabItem] = []
    var cornerRadius: CGFloat = 3
    var dispatchQueue: PunaDispatchQueueType = DispatchQueue.main

    init() {}

    init(type: PunaTabsTypeProtocol,
         style: PunaTabsStyle,
         widthConstraint: CGFloat,
         tabsList: [PunaTabItem],
         currentSelection: Int,
         fullWidthTab: Bool,
         dispatchQueue: PunaDispatchQueueType) {
        self.currentSelection = type.currentSelection
        self.distribution = type.distribution
        self.textAlignment = type.textAlignment
        self.widthPriority = type.widthPriority
        self.style = style
        self.widthConstraint = widthConstraint
        self.tabsList = tabsList
        self.currentSelection = currentSelection
        self.fullWidthTab = fullWidthTab
        self.dispatchQueue = dispatchQueue
    }
}
