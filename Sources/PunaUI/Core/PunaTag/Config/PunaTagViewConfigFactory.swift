//
//  PunaTagViewConfigFactory.swift
//  PunaUI
//
//  Created by Samuel Sainz on 5/28/20.
//

import Foundation

internal class PunaTagViewConfigFactory {

    static func provideInternalConfig(fromSimpleTag tag: PunaTagSimple) -> PunaTagViewConfig {

        let type = PunaTagTypeFactory.provide(tag.type)
        let size = PunaTagSizeFactory.provide(tag.size)

        let backgroundColor = type.backgroundColor
        let borderColor = type.borderColor
        let buttonColor = type.buttonColor

        let height = size.height
        let horizontalPadding = size.horizontalPadding
        let cornerRadius = size.cornerRadius

        let text = tag.text
        let textFont = size.font
        let textColor = type.textColor

        let leftContent = size.shouldShowLeftContent ? tag.leftContent : nil
        let rightButtonWidth = tag.isDismissible ? size.rightButtonWidth : 0
        let rightButtonImageName = tag.isDismissible ? PunaIcons.close16 : nil

        let accesibilityLabel = "Cerrar".localized()

        return PunaTagViewConfig(backgroundColor: backgroundColor, borderColor: borderColor, buttonColor: buttonColor, height: height, horizontalPadding: horizontalPadding, cornerRadius: cornerRadius, text: text, textFont: textFont, textColor: textColor, leftContent: leftContent, rightButtonImageName: rightButtonImageName, rightButtonWidth: rightButtonWidth, accessibilityLabel: accesibilityLabel)
    }

    static func provideInternalConfig(fromChoiceTag tag: PunaTagChoice) -> PunaTagViewConfig {

        let state = PunaTagStateFactory.provide(tag.state)
        let size = PunaTagSizeFactory.provide(tag.size)
        let type = PunaTagChoiceTypeFactory.provide(tag.type, forState: state)

        let backgroundColor = state.backgroundColor
        let borderColor = state.borderColor
        let buttonColor = state.buttonColor

        let height = size.height
        let horizontalPadding = size.horizontalPadding
        let cornerRadius = size.cornerRadius

        let text = tag.text
        let textFont = size.font
        let textColor = state.textColor

        var leftContent = size.shouldShowLeftContent ? tag.leftContent : nil

        if let leftContentIcon = leftContent as? PunaTagLeftContentIcon {
            leftContentIcon.iconColor = state.buttonColor
            leftContent = leftContentIcon
        }

        let rightButtonImageName = type.rightButtonImageName

        let rightButtonWidth: CGFloat = rightButtonImageName != nil ? size.rightButtonWidth : 0

        let shouldAnimateRightContent: Bool = tag.shouldAnimateTag

        let accessibilityTextSelected = tag.state == .selected ? "Seleccionado".localized() : ""
        let accessibilityLabel = "\(text ?? "")\(accessibilityTextSelected)"

        return PunaTagViewConfig(backgroundColor: backgroundColor, borderColor: borderColor, buttonColor: buttonColor, height: height, horizontalPadding: horizontalPadding, cornerRadius: cornerRadius, text: text, textFont: textFont, textColor: textColor, leftContent: leftContent, rightButtonImageName: rightButtonImageName, rightButtonWidth: rightButtonWidth, shouldAnimateRightContent: shouldAnimateRightContent, accessibilityLabel: accessibilityLabel)
    }
}
