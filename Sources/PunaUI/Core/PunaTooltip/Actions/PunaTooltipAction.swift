//
//  PunaTooltipAction.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 10-02-21.
//

import Foundation
import UIKit

@objc public class PunaTooltipAction: NSObject {
    let text: String
    let onPressed: (() -> Void)
    var type: PunaTooltipActionType = .loud

    @objc public init(text: String, onPressed: @escaping (() -> Void)) {
        self.text = text
        self.onPressed = onPressed
    }

    func configure(with type: PunaTooltipActionType) {
        self.type = type
    }
}

internal enum PunaTooltipActionType {
    case loud
    case quiet
    case link
    case transparent
}

internal class PunaTooltipActionFactory {

    class func provide(action: PunaTooltipAction, tooltipType: PunaTooltipType) -> PunaButtonViewConfig {

        switch action.type {
        case .link:
            return createLinkConfig(action: action, tooltipType: tooltipType)
        case .loud:
            return createLoudConfig(action: action, tooltipType: tooltipType)
        case .quiet:
            return createQuietConfig(action: action)
        case .transparent:
            return createTransparentConfig(action: action, tooltipType: tooltipType)
        }
    }

    private class func createLoudConfig(action: PunaTooltipAction, tooltipType: PunaTooltipType) -> PunaButtonViewConfig {
        switch tooltipType {
        case .light, .dark:
            return PunaButtonViewConfigFactory.provide(hierarchy: .loud, size: .medium, text: action.text, icon: nil)
        case .highlight:
            let hierarchy = PunaTooltipHighlightLoudHierarchy()
            return PunaButtonViewConfigFactory.provide(
                hierarchy: hierarchy,
                size: PunaButtonSizeMedium(),
                text: action.text,
                textattributes: [:],
                icon: nil)
        }
    }

    private class func createTransparentConfig(action: PunaTooltipAction, tooltipType: PunaTooltipType) -> PunaButtonViewConfig {
        switch tooltipType {
        case .light:
            return PunaButtonViewConfigFactory.provide(hierarchy: .transparent, size: .medium, text: action.text, icon: nil)
        case .highlight, .dark:
            let hierarchy = PunaTooltipActionBasicHierarchy(textColor: UIColor.Puna.white, pressedColor: .clear)
            return PunaButtonViewConfigFactory.provide(
                hierarchy: hierarchy,
                size: PunaButtonSizeMedium(),
                text: action.text,
                textattributes: [:],
                icon: nil)
        }
    }

    private class func createQuietConfig(action: PunaTooltipAction) -> PunaButtonViewConfig {
            return PunaButtonViewConfigFactory.provide(hierarchy: .quiet, size: .medium, text: action.text, icon: nil)
    }

    private class func createLinkConfig(action: PunaTooltipAction, tooltipType: PunaTooltipType) -> PunaButtonViewConfig {

        let textAttr = provideLinkAttr(tooltipType: tooltipType)
        let hierarchy = provideActionLinkHierarchy(tooltipType: tooltipType)
        return PunaButtonViewConfigFactory.provide(
            hierarchy: hierarchy,
            size: PunaLinkButtonSizeMedium(),
            text: action.text,
            textattributes: textAttr,
            icon: nil)
    }

    private class func provideLinkAttr(tooltipType: PunaTooltipType) ->  [NSAttributedString.Key: Any] {
        switch tooltipType {
        case .dark, .highlight:
            return [.underlineStyle: NSUnderlineStyle.single.rawValue]
        case .light:
            return [:]
        }
    }

    private class func provideActionLinkHierarchy(tooltipType: PunaTooltipType) -> PunaButtonHierarchyProtocol {
        switch tooltipType {
        case .dark, .highlight:
            return PunaTooltipActionBasicHierarchy(textColor: UIColor.Puna.white, pressedColor: .clear)
        case .light:
            return PunaTooltipActionBasicHierarchy(textColor: PunaStyleSheetManager.styleSheet.accentColor, pressedColor: .clear)
        }
    }

}
