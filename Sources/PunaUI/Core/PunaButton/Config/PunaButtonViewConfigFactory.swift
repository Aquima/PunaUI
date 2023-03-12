//
//  PunaButtonViewConfigFactory.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 22/01/2020.
//

import Foundation
import UIKit
/**
The responsability of the factory is to provide the ViewConfig from the user specified attributes
*/
internal class PunaButtonViewConfigFactory {

    static func provide(hierarchy: PunaButtonHierarchy, size: PunaButtonSize, text: String, textattributes: [NSAttributedString.Key: Any] = [:], icon: PunaButtonIcon?) -> PunaButtonViewConfig {

        let buttonHierarchy = PunaButtonHierarchyFactory.provideStyle(key: hierarchy)
        let buttonSize = PunaButtonSizeFactory.provideStyle(key: size, icon: icon)
        return provide(hierarchy: buttonHierarchy,
                       size: buttonSize,
                       text: text,
                       textattributes: textattributes,
                       icon: icon)
    }

    static func provide(hierarchy: PunaButtonHierarchyProtocol, size: PunaButtonSizeProtocol, text: String, textattributes: [NSAttributedString.Key: Any] = [:], icon: PunaButtonIcon?) -> PunaButtonViewConfig {

        let viewConfig = PunaButtonViewConfig(backgroundColor: hierarchy.idleColor.cgColor,
                                               pressedColor: hierarchy.pressedColor.cgColor,
                                               disableColor: hierarchy.disableColor.cgColor,
                                               text: text,
                                               textColor: hierarchy.fontColor,
                                               textAttributes: textattributes,
                                               textDisableColor: PunaStyleSheetManager.styleSheet.textColorDisabled,
                                               font: size.font,
                                               cornerRadius: size.borderRadius,
                                               height: size.height,
                                               padding: size.padding,
                                               icon: icon?.icon,
                                               iconColor: hierarchy.fontColor,
                                               iconDisableColor: PunaStyleSheetManager.styleSheet.textColorDisabled,
                                               spinnerTintColor: hierarchy.spinnerTintColor,
                                               spinnerSize: size.spinnerSize)

        return viewConfig
    }
}
