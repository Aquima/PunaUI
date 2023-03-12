//
//  PunaMessageViewConfig.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/17/20.
//

import Foundation
import UIKit

/// used to define the ui of internal PunaMessage views
internal struct PunaMessageViewConfig {
    var backgroundColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
    var pipeColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
    var titleText: String?
    var titleStyle: PunaFontStyle = getTitleStyle(PunaStyleSheetManager.styleSheet.textColorWhite)
    var bodyStyle: PunaFontStyle = getBodyStyle(PunaStyleSheetManager.styleSheet.textColorWhite)
    var bodyText: String?
    var maxLines: UInt16 = 0

    var icon: String?
    var thumbnail: UIImage?
    var iconColor: UIColor = PunaStyleSheetManager.styleSheet.textColorWhite
    var iconBackgroundColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor600

    var isDismissable: Bool = false
    var dismissIconName: String? = PunaIcons.close20
    var dismissIconColor: UIColor = PunaStyleSheetManager.styleSheet.textColorWhite

    var primaryActionConfig: PunaButtonViewConfig?
    var secondaryActionConfig: PunaButtonViewConfig?
    var linkActionConfig: PunaButtonViewConfig?

    var bodyLinks: PunaBodyLinks?
    var bodyLinkIsUnderline: Bool = false
    var bodyLinkTextColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor500

    var bullets: [PunaBullet] = []

    init(backgroundColor: UIColor, pipeColor: UIColor, textColor: UIColor, titleText: String?, bodyText: String, icon: String?, bullets: [PunaBullet], iconBackgroundColor: UIColor, isDismissable: Bool, dismissIconColor: UIColor, bodyLinks: PunaBodyLinks?, bodyLinkIsUnderline: Bool, bodyLinkTextColor: UIColor,
         thumbnail: UIImage?) {
        self.backgroundColor = backgroundColor
        self.pipeColor = pipeColor

        titleStyle = PunaMessageViewConfig.getTitleStyle(textColor)
        bodyStyle = PunaMessageViewConfig.getBodyStyle(textColor)

        self.titleText = titleText
        self.bodyText = bodyText
        self.bullets = bullets
        self.icon = icon
        self.isDismissable = isDismissable

        self.iconBackgroundColor = iconBackgroundColor
        self.dismissIconColor = dismissIconColor

        self.bodyLinks = bodyLinks
        self.bodyLinkIsUnderline = bodyLinkIsUnderline
        self.bodyLinkTextColor = bodyLinkTextColor
        self.thumbnail = thumbnail
    }

    init() {

    }

    private static func getTitleStyle(_ color: UIColor) -> PunaFontStyle {
        return PunaFontStyle(textColor: color, font: PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16), sketchLineHeight: 20)
    }

    private static func getBodyStyle(_ color: UIColor) -> PunaFontStyle {
        return PunaFontStyle(textColor: color, font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14), sketchLineHeight: 18)
    }
}
