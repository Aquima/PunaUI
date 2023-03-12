//
//  PunaTagViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal struct PunaTagViewConfig {
    var backgroundColor: UIColor = UIColor.clear

    var borderColor: UIColor = UIColor.Puna.gray250

    var buttonColor: UIColor = UIColor.Puna.gray550

    var height: CGFloat?

    var horizontalPadding: CGFloat?

    var cornerRadius: CGFloat?

    var text: String? = "Label"

    var textFont: UIFont?

    var textColor: UIColor = PunaStyleSheetManager.styleSheet.textColorPrimary

    var leftContent: PunaTagLeftContent?

    var rightButtonImageName: String?

    var rightButtonWidth: CGFloat = 0

    var shouldAnimateRightContent: Bool = false

    var accessibilityLabel: String = ""

    init() {}

    init(backgroundColor: UIColor, borderColor: UIColor, buttonColor: UIColor, height: CGFloat, horizontalPadding: CGFloat, cornerRadius: CGFloat, text: String?, textFont: UIFont, textColor: UIColor, leftContent: PunaTagLeftContent? = nil, rightButtonImageName: String?, rightButtonWidth: CGFloat, shouldAnimateRightContent: Bool = false, accessibilityLabel: String) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.buttonColor = buttonColor
        self.height = height
        self.horizontalPadding = horizontalPadding
        self.cornerRadius = cornerRadius
        self.text = text
        self.textFont = textFont
        self.textColor = textColor
        self.leftContent = leftContent
        self.rightButtonImageName = rightButtonImageName
        self.rightButtonWidth = rightButtonWidth
        self.shouldAnimateRightContent = shouldAnimateRightContent
        self.accessibilityLabel = accessibilityLabel
    }
}
