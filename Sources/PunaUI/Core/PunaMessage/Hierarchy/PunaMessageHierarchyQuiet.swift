//
//  PunaMessageHierarchyQuiet.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
import UIKit

struct PunaMessageHierarchyQuiet: PunaMessageHierarchyProtocol {
    var primaryButtonHierarchy: PunaButtonHierarchyProtocol = PunaButtonHierarchyLoud()

    var secondaryButtonHierarchy: PunaButtonHierarchyProtocol = PunaButtonHierarchyTransparent()

    var linkButtonHierarchy: PunaButtonHierarchyProtocol = LinkMessageActionButtonHierarchy(textColor: PunaStyleSheetManager.styleSheet.accentColor, pressedColor: .clear)

    var dismissButtonColor: UIColor = PunaStyleSheetManager.styleSheet.textColorPrimary

    var textColor: UIColor = PunaStyleSheetManager.styleSheet.textColorPrimary

    var backgroundColor: UIColor = UIColor.Puna.gray040

    var pipeColor: UIColor

    var accentColor: UIColor

    var bodyLinkIsUnderline: Bool

    var bodyLinkTextColor: UIColor

    init(type: PunaMessageTypeProtocol) {
        pipeColor = type.primaryColor
        accentColor = type.primaryColor
        primaryButtonHierarchy = PunaButtonHierarchyLoud()
        secondaryButtonHierarchy = PunaButtonHierarchyTransparent()
        linkButtonHierarchy = LinkMessageActionButtonHierarchy(textColor: PunaStyleSheetManager.styleSheet.accentColor500,
                                                               pressedColor: type.linkButtonPressedColor
        )
        bodyLinkIsUnderline = false
        bodyLinkTextColor = PunaStyleSheetManager.styleSheet.accentColor500
    }
}
