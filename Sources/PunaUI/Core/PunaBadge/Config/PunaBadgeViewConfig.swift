//
//  PunaBadgeViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import Foundation
import UIKit

/// used to define the ui of internal PunaBadge views
internal struct PunaBadgeViewConfig {

    var backgroundColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor

    var height: CGFloat?
    var verticalPadding: CGFloat?
    var horizontalPadding: CGFloat?

    var text: String? = "Label"
    var textStyle: PunaFontStyle?

    var icon: String?
    var iconColor: UIColor?
    var iconBackgroundColor: UIColor?

    var cornerRadius: CGFloat = 6.0
    var roundedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]

    init() {}

    init(backgroundColor: UIColor, text: String, sizeStyle: PunaBadgeSizeProtocol, textColor: UIColor, roundedCorners: CACornerMask) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = sizeStyle.borderRadius
        self.height = sizeStyle.height
        self.verticalPadding = sizeStyle.verticalPadding
        self.textStyle = PunaFontStyle(textColor: textColor, font: sizeStyle.font, lineSpacing: sizeStyle.lineSpacing)
        self.text = text
        self.roundedCorners = roundedCorners
    }

    init(backgroundColor: UIColor, text: String, sizeStyle: PunaBadgeSizeProtocol, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = sizeStyle.borderRadius
        self.height = sizeStyle.height
        self.verticalPadding = sizeStyle.verticalPadding
        self.textStyle = PunaFontStyle(textColor: textColor, font: sizeStyle.font, lineSpacing: sizeStyle.lineSpacing)
        self.text = text
    }

    init(icon: String, backgroundColor: UIColor, sizeStyle: PunaBadgeSizeProtocol) {
        self.icon = icon
        self.backgroundColor = backgroundColor
        self.height = sizeStyle.height
        self.cornerRadius = sizeStyle.borderRadius
        self.verticalPadding = sizeStyle.verticalPadding
    }
}
