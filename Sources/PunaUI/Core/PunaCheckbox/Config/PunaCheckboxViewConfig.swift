//
//  PunaCheckboxViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 29/03/2021.
//

import Foundation
import UIKit

/// used to define the ui of internal PunaCheckbox views
internal struct PunaCheckboxViewConfig {

    var title: String?
    var titleNumberOfLines: Int = 1
    var icon: String?
    var borderColor: UIColor?
    var textColor: UIColor!
    var iconColor: UIColor?
    var align: PunaCheckboxAlign = PunaCheckboxAlign.left
    var backgroundColor: UIColor = UIColor.Puna.white
    var cornerRadius: CGFloat = 3
    var borderSize: CGFloat?
    var type: PunaCheckboxTypeProtocol! = PunaCheckboxTypeIdle()
    var status: PunaCheckboxStatusProtocol! = PunaCheckboxStatusUnselected()

    init () { }

    init(for checkbox: PunaCheckbox) {
        self.title = checkbox.title
        self.align = checkbox.align
        self.status = PunaCheckboxStatusFactory.provide(checkbox.status)
        self.icon = status.icon
        self.type = PunaCheckboxTypeFactory.provide(checkbox.type, status: checkbox.status)
        self.textColor = type.textColor
        self.cornerRadius = type.cornerRadius
        self.iconColor = self.type.iconColor
        self.borderColor = type.borderColor
        self.borderSize = type.borderSize
        self.backgroundColor = type.backgroundColor
        self.titleNumberOfLines = checkbox.titleNumberOfLines
    }
}
