//
//  PunaThumbnailAccessibilityManager.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaThumbnailAccessibilityManager: PunaAccessibilityManager {
    private weak var view: PunaThumbnail!

	required init(view: UIView) {
		guard let accessibleView = view as? PunaThumbnail else {
			fatalError("PunaThumbnailAccessibilityManager should recieve an PunaThumbnail")
		}
		self.view = accessibleView
	}

	func viewUpdated() {
		guard let accessibilityDescription = view.accessibilityDescription else {
			view.isAccessibilityElement = false
			return
		}
		view.isAccessibilityElement = true
        view.accessibilityLabel = accessibilityDescription +
            ", \(view.type == .icon ? "icon accessibility".localized() : "image accessibility".localized())"
	}

	func accessibilityActivated() {
		// Not needed
	}
}
