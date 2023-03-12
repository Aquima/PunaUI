//
//  PunaCheckboxDisabledType.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/16/20.
//

import Foundation
import UIKit

/// Handle checkbox disabled type
class PunaCheckboxTypeDisabled: PunaCheckboxTypeProtocol {
    var borderColor: UIColor?
    var borderSize: CGFloat?
    var textColor: UIColor = UIColor.Puna.gray250
    var backgroundColor: UIColor = UIColor.Puna.gray100
    var iconColor: UIColor? = UIColor.Puna.gray250
    var cornerRadius: CGFloat = 3

    init() {}

    init(status: PunaCheckboxStatus) {
        let statusProtocol = PunaCheckboxStatusFactory.provide(status)
        if status == .unselected {
            self.backgroundColor = statusProtocol.backgroundColor
            self.borderColor = UIColor.Puna.gray100
            self.borderSize = 2
        }
    }
}
