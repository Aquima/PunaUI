//
//  PunaTextFieldCodeViewConfig.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation
import UIKit

/// Used to define the UI of internal PunaTextFieldCode views.
struct PunaTextFieldCodeViewConfig {

    var labelText: String?
    var helperText: String?
    var style: PunaTextFieldCodeStyle = .THREESOME
    var state: PunaTextFieldCodeState = .IDLE
    var labelStyle: PunaFontStyle = getLabelStyle(PunaStyleSheetManager.styleSheet.textColorPrimary)
    var helperStyle: PunaFontStyle = getHelperTextStyle(PunaStyleSheetManager.styleSheet.textColorSecondary)
    var helperIcon: String?
    var helperIconTintColor: UIColor?
    var helperIconBgColor: UIColor?

    init(labelText: String?, helperText: String?, style: PunaTextFieldCodeStyle, state: PunaTextFieldCodeState, stateStyle: PunaTextFieldCodeStateProtocol) {
        self.labelText = labelText
        self.helperText = helperText
        self.style = style
        self.state = state
        self.labelStyle = PunaTextFieldCodeViewConfig.getLabelStyle(stateStyle)
        self.helperStyle = PunaTextFieldCodeViewConfig.getHelperTextStyle(stateStyle)
        self.helperIcon = stateStyle.helperIconName
        self.helperIconTintColor = stateStyle.helperIconTintColor
        self.helperIconBgColor = stateStyle.helperIconBgColor
    }

    init() {
    }
}

// MARK: Privates
private extension PunaTextFieldCodeViewConfig {

    static func getLabelStyle(_ stateStyle: PunaTextFieldCodeStateProtocol) -> PunaFontStyle {
        return PunaTextFieldCodeViewConfig.getLabelStyle(stateStyle.labelTextColor)
    }

    static func getHelperTextStyle(_ stateStyle: PunaTextFieldCodeStateProtocol) -> PunaFontStyle {
        PunaTextFieldCodeViewConfig.getHelperTextStyle(stateStyle.helperTextColor, semiBold: stateStyle.helperSemibold)
    }

    static func getLabelStyle(_ color: UIColor) -> PunaFontStyle {
        return PunaFontStyle(textColor: color, font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14), sketchLineHeight: 14)
    }

    static func getHelperTextStyle(_ color: UIColor, semiBold: Bool = false) -> PunaFontStyle {
        let font = semiBold ? PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 13) : PunaStyleSheetManager.styleSheet.regularSystemFont(size: 13)
        return PunaFontStyle(textColor: color, font: font, sketchLineHeight: 14)
    }
}
