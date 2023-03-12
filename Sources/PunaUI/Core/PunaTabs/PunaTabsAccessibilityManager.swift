//
//  
//  PunaTabsAccessibilityManager.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaTabsAccessibilityManager: PunaAccessibilityManager {
    private weak var view: PunaTabs!

    required init(view: UIView) {
        guard let accessibleView = view as? PunaTabs else {
            fatalError("PunaTabs AccessibilityManager should recieve an PunaTabs")
        }
        self.view = accessibleView
        viewUpdated()
    }

    func viewUpdated() {
        (view.contentView as? PunaTabsAbstractView)?.tabsViews.enumerated().forEach {
            $0.element.isAccessibilityElement = true
            var accessibilityLabel: String = self.view.selectedTabPosition == $0.offset ? "TabSelected".localized() : ""
            accessibilityLabel += $0.element.tabTitle.text ?? ""
            accessibilityLabel += "TabDescription".localized()
            accessibilityLabel += "TabsCurrentStatus".localizeWithFormat(arguments: $0.offset + 1, view.tabs.count)
            $0.element.accessibilityLabel = accessibilityLabel
        }
    }

    func accessibilityActivated() {
        // Not needed
    }
}
