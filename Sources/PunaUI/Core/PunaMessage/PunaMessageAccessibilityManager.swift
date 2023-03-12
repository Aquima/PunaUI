//
//  PunaMessageAccessibilityManager.swift
//  PunaUI
//
//  Created by Ana Cristina Calderon Castrillon on 17/09/21.
//

import Foundation
import UIKit

class PunaMessageAccessibilityManager: PunaAccessibilityManager {
    private weak var view: PunaMessage!

    required init(view: UIView) {
        guard let accessibleView = view as? PunaMessage else {
            fatalError("PunaMessageAccessibilityManager should recieve an PunaMessage")
        }
        self.view = accessibleView
        viewUpdated()
    }

    func viewUpdated() {
        (view.contentView as? PunaMessageAbstractView)?.titleLabel.isAccessibilityElement = true
        (view.contentView as? PunaMessageAbstractView)?.titleLabel.accessibilityLabel = view.title
        (view.contentView as? PunaMessageAbstractView)?.titleLabel.accessibilityTraits = UIAccessibilityTraits.header
    }

    func accessibilityActivated() {
        // Not needed
    }
}
