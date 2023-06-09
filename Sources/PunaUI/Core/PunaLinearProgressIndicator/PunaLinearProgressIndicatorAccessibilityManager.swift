//
//  PunaLinearProgressIndicatorAccessibilityManager.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

class PunaLinearProgressIndicatorAccessibilityManager: PunaAccessibilityManager {
    private weak var view: PunaLinearProgressIndicator!

    required init(view: UIView) {
        guard let accessibleView = view as? PunaLinearProgressIndicator else {
            fatalError("PunaLinearProgressIndicatorAccessibilityManager should recieve an PunaLinearProgressIndicator")
        }
        self.view = accessibleView
        viewUpdated()
    }

    func viewUpdated() {
        view.isAccessibilityElement = true
        view.accessibilityTraits = .none
        if let linearProgress = view as? PunaLinearProgressIndicatorDeterminate {
            view.accessibilityLabel = "\(linearProgress.currentStep)\("inProgress".localized())"
        } else {
            view.accessibilityLabel = "inProgress".localized()
        }
    }

    func accessibilityActivated() {

    }
}
