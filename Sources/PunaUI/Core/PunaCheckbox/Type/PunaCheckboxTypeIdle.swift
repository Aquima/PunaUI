//
//  PunaCheckboxTypeIdle.swift
//  PunaUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
import UIKit

// Handle checkbox Idle type
class PunaCheckboxTypeIdle: PunaCheckboxTypeProtocol {
    var borderColor: UIColor?
    var borderSize: CGFloat?
    var textColor: UIColor = PunaStyleSheetManager.styleSheet.textColorPrimary
    var backgroundColor: UIColor = UIColor.Puna.white
    var iconColor: UIColor? = UIColor.Puna.white
    var cornerRadius: CGFloat = 3

    init() {

    }

    init(status: PunaCheckboxStatus) {
        let statusProtocol = PunaCheckboxStatusFactory.provide(status)
        self.backgroundColor = statusProtocol.backgroundColor
        if status == PunaCheckboxStatus.unselected {
            self.borderColor = UIColor.Puna.gray250
            self.borderSize = 2
        }
    }
}
