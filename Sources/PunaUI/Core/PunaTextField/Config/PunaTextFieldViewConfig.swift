//
//  PunaTextFieldViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/// used to define the ui of internal PunaTextField views
internal struct PunaTextFieldViewConfig {
    var labelText: String?
    var labelStyle: PunaFontStyle = getLabelStyle(PunaStyleSheetManager.styleSheet.textColorPrimary)

    var helperText: String?
    var helperStyle: PunaFontStyle = getHelperTextStyle(PunaStyleSheetManager.styleSheet.textColorSecondary)

    var counter: UInt16 = 0
    var counterStyle: PunaFontStyle = getCounterTextStyle(PunaStyleSheetManager.styleSheet.textColorSecondary)

    var placeholderStyle: PunaFontStyle = getHelperTextStyle(PunaStyleSheetManager.styleSheet.textColorSecondary)
    var placeholderText: String?

    var inputBgColor: UIColor = PunaStyleSheetManager.styleSheet.bgColorPrimary
    var inputTextStyle: PunaFontStyle = getHelperTextStyle(PunaStyleSheetManager.styleSheet.textColorPrimary)

    var textFieldBorderDashed = false
    var editingEnabled: Bool = true

    var textFieldBorderColor: UIColor = PunaStyleSheetManager.styleSheet.bgColorSecondary
    var textFieldBorderWidth: CGFloat = 1
    var textFieldBorderRadious: CGFloat = 6

    var paddings: PunaTextInputPadding = PunaTextInputPadding.defaultPadding

    var helperIcon: String?
    var helperIconColor: UIColor?
    var helperIconBgColor: UIColor?

    var leftViewComponent: PunaTextFieldLeftComponent?
    var leftComponentNeedsReload = true
    var rightViewComponent: PunaTextFieldRightComponent?
    var rightComponentNeedsReload = true

    var textInputTraits: UITextInputTraits?
    var maxLines: UInt16?
    var accessibilityActivated: (() -> Void)?

    init(labelText: String?,
         helperText: String?,
         counter: UInt16,
         placeholderText: String?,
         stateStyle: PunaTextFieldStateProtocol,
         leftViewComponent: PunaTextFieldLeftComponent?,
         rightViewComponent: PunaTextFieldRightComponent?,
         inputTraits: UITextInputTraits?,
         maxLines: UInt16? = nil,
         paddings: PunaTextInputPadding,
         accessibilityActivated: (() -> Void)?) {

        self.labelText = labelText
        self.helperText = helperText
        self.counter = counter
        self.placeholderText = placeholderText
        self.maxLines = maxLines
        self.paddings = paddings

        self.labelStyle = PunaTextFieldViewConfig.getLabelStyle(stateStyle.labelTextColor)
        self.counterStyle = PunaTextFieldViewConfig.getCounterTextStyle(stateStyle.helperColor)
        self.placeholderStyle = PunaTextFieldViewConfig.getInputTextStyle(stateStyle.placeholderTextColor)
        self.inputTextStyle = PunaTextFieldViewConfig.getInputTextStyle(stateStyle.inputTextColor)
        self.inputBgColor = stateStyle.backgroundColor
        self.textFieldBorderColor = stateStyle.borderColor
        self.helperIcon = stateStyle.helperIconName
        self.helperIconColor = stateStyle.helperIconTintColor
        self.helperIconBgColor = stateStyle.helperColor
        self.helperStyle = PunaTextFieldViewConfig.getHelperTextStyle(stateStyle.helperColor, semiBold: stateStyle.helperSemibold)

        self.editingEnabled = stateStyle.editingEnabled
        self.textFieldBorderWidth = stateStyle.borderWidth
        self.textFieldBorderDashed = stateStyle.borderDashed
        self.leftViewComponent = leftViewComponent
        self.rightViewComponent = rightViewComponent

        self.textInputTraits = inputTraits
        self.accessibilityActivated = accessibilityActivated
    }

    init() {

    }

    private static func getLabelStyle(_ color: UIColor) -> PunaFontStyle {
        return PunaFontStyle(textColor: color, font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14), sketchLineHeight: 14)
    }

    private static func getHelperTextStyle(_ color: UIColor, semiBold: Bool = false) -> PunaFontStyle {
        let font = semiBold ? PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 13) : PunaStyleSheetManager.styleSheet.regularSystemFont(size: 13)

        return PunaFontStyle(textColor: color, font: font, sketchLineHeight: 14)
    }

    internal static func getInputTextStyle(_ color: UIColor) -> PunaFontStyle {
        return PunaFontStyle(textColor: color, font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: 16), sketchLineHeight: 22)
    }

    private static func getCounterTextStyle(_ color: UIColor) -> PunaFontStyle {
        return PunaFontStyle(textColor: color, font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: 13), sketchLineHeight: 14)
    }
}
