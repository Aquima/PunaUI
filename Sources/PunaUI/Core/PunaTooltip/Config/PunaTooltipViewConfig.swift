//
//  
//  PunaTooltipViewConfig.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 19-01-21.
//
//

import Foundation
import UIKit

/// used to define the ui of internal PunaTooltip views
internal struct PunaTooltipViewConfig {

    let title: String?
    let content: String
    let isDismissable: Bool

    let textColor: UIColor
    let backgroundColor: UIColor
    let closeButtonColor: UIColor
    let maxWidth: CGFloat

    let shadowColor: UIColor
    let shadowOffset: CGSize
    let shadowRadius: CGFloat
    let shadowOpacity: CGFloat

    let primaryActionConfig: PunaButtonViewConfig?
    let secondaryActionConfig: PunaButtonViewConfig?

    let primaryActionOnPressed: (() -> Void)?
    let secondaryActionOnPressed: (() -> Void)?

    let sizeStyle: PunaTooltipWidthSize

    init(type: PunaTooltipTypeProtocol,
         title: String?,
         content: String,
         isDismissable: Bool,
         primaryActionConfig: PunaButtonViewConfig?,
         secondaryActionConfig: PunaButtonViewConfig?,
         primaryActionOnPressed: (() -> Void)?,
         secondaryActionOnPressed: (() -> Void)?,
         sizeStyle: PunaTooltipWidthSize) {
        backgroundColor = type.backgroundColor
        maxWidth = type.maxWidth
        shadowOffset = type.shadowOffset
        shadowRadius = type.shadowRadius
        shadowOpacity = type.shadowOpacity
        textColor = type.textColor
        closeButtonColor = type.closeButtonColor
        shadowColor = type.shadowColor

        self.title = title
        self.content = content
        self.isDismissable = isDismissable
        self.primaryActionConfig = primaryActionConfig
        self.secondaryActionConfig = secondaryActionConfig
        self.primaryActionOnPressed = primaryActionOnPressed
        self.secondaryActionOnPressed = secondaryActionOnPressed
        self.sizeStyle = sizeStyle
    }

    func getTitleStyle() -> PunaFontStyle {
        return PunaFontStyle(
            textColor: self.textColor,
            font: PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16),
            sketchLineHeight: 20
        )
    }

    func getContentStyle() -> PunaFontStyle {
        return PunaFontStyle(
            textColor: self.textColor,
            font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14),
            sketchLineHeight: 18
        )
    }
}
