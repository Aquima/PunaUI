//
//  PunaMessageHierarchyLoud.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
import UIKit

struct PunaMessageHierarchyLoud: PunaMessageHierarchyProtocol {
    var primaryButtonHierarchy: PunaButtonHierarchyProtocol

    var secondaryButtonHierarchy: PunaButtonHierarchyProtocol

    var linkButtonHierarchy: PunaButtonHierarchyProtocol

    var dismissButtonColor: UIColor = PunaStyleSheetManager.styleSheet.textColorWhite

    var textColor: UIColor = PunaStyleSheetManager.styleSheet.textColorWhite

    var backgroundColor: UIColor

    var pipeColor: UIColor

    var accentColor: UIColor

    var bodyLinkIsUnderline: Bool

    var bodyLinkTextColor: UIColor

    init(type: PunaMessageTypeProtocol) {
        backgroundColor = type.primaryColor
        pipeColor = type.primaryColor
        accentColor = type.secondaryColor
        primaryButtonHierarchy = PrimaryMessageActionButtonHierarchy(backgroundColor: type.secondaryColor, pressedColor: type.primaryButtonPressedColor)
        secondaryButtonHierarchy = SecondaryMessageActionButtonHierarchy(textColor: textColor, pressedColor: type.secondaryButtonPressedColor)
        linkButtonHierarchy = LinkMessageActionButtonHierarchy(textColor: textColor, pressedColor: type.linkButtonPressedColor)
        bodyLinkIsUnderline = true
        bodyLinkTextColor = textColor
    }
}
