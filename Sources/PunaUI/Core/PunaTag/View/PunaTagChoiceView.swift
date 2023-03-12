//
//  PunaTagChoiceView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaTagChoiceView: PunaTagSimpleView {

    override func updateView() {
        super.updateView()
        self.rightButton.isUserInteractionEnabled = false
        self.isAccessibilityElement = true
        self.accessibilityLabel = config.accessibilityLabel
    }
    override func setupRightContent() {
        super.setupRightContent()
        if config.shouldAnimateRightContent {
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        }
    }

}
