//
//  PunaMessageViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

internal class PunaMessageViewConfigFactory {
    static func provideConfig(for message: PunaMessage) -> PunaMessageViewConfig {
        let typeIns = PunaMessageTypeFactory.provide(message.type)
        let hierarchyIns = PunaMessageHierarchyFactory.provide(message.hierarchy, forType: typeIns)

        var config = PunaMessageViewConfig(backgroundColor: hierarchyIns.backgroundColor, pipeColor: hierarchyIns.pipeColor, textColor: hierarchyIns.textColor, titleText: message.title, bodyText: message.body, icon: typeIns.icon, bullets: message.bullets, iconBackgroundColor: hierarchyIns.accentColor, isDismissable: message.isDismissable, dismissIconColor: hierarchyIns.textColor, bodyLinks: message.bodyLinks, bodyLinkIsUnderline: hierarchyIns.bodyLinkIsUnderline, bodyLinkTextColor: hierarchyIns.bodyLinkTextColor, thumbnail: message.thumbnail)

        if let primaryText = message.primaryActionText, !primaryText.isEmpty {
            config.primaryActionConfig = PunaButtonViewConfigFactory.provide(hierarchy: hierarchyIns.primaryButtonHierarchy, size: PunaButtonSizeMedium(), text: primaryText, icon: nil)
        }

        if let secondaryText = message.secondaryActionText, !secondaryText.isEmpty {
            config.secondaryActionConfig = PunaButtonViewConfigFactory.provide(hierarchy: hierarchyIns.secondaryButtonHierarchy, size: PunaButtonSizeMedium(), text: secondaryText, icon: nil)
        }

        if let linkText = message.linkActionText, !linkText.isEmpty {
            let textAttr: [NSAttributedString.Key: Any] = message.hierarchy == .loud ? [.underlineStyle: NSUnderlineStyle.single.rawValue] : [:]

            config.linkActionConfig = PunaButtonViewConfigFactory.provide(hierarchy: hierarchyIns.linkButtonHierarchy,
                                                                           size: PunaLinkButtonSizeMedium(),
                                                                           text: linkText,
                                                                           textattributes: textAttr,
                                                                           icon: nil)
        }

        return config
    }
}
