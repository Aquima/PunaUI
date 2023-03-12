//
//  PunaStyleSheet.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public protocol PunaStyleSheet: PunaColors, PunaFonts {}

/**
  PunaColors is used to create a new StyleSheet
  implementing all the necessary colors
*/
@objc public protocol PunaColors {

    /**
      The default colors that you need to override
      to use your color palette through all the UI components
    */
    var bgColorPrimary: UIColor { get }
    var bgColorSecondary: UIColor { get }
    var bgColorWhite: UIColor { get }

    var brandColor500: UIColor { get }

    var accentColor: UIColor { get }
    var accentColor100: UIColor { get }
    var accentColor150: UIColor { get }
    var accentColor200: UIColor { get }
    var accentColor300: UIColor { get }
    var accentColor400: UIColor { get }
    var accentColor500: UIColor { get }
    var accentColor600: UIColor { get }
    var accentColor700: UIColor { get }
    var accentColor800: UIColor { get }

    var textColorPrimary: UIColor { get }
    var textColorSecondary: UIColor { get }
    var textColorDisabled: UIColor { get }
    var textColorNegative: UIColor { get }
    var textColorCaution: UIColor { get }
    var textColorPositive: UIColor { get }
    @available(*, deprecated, renamed: "textColorLink")
    @objc optional var tetColorLink: UIColor { get }
    var textColorLink: UIColor { get }
    var textColorWhite: UIColor { get }
    var textColorWarning: UIColor { get }

    var feedbackColorNegative: UIColor { get }
    var feedbackColorCaution: UIColor { get }
    var feedbackColorPositive: UIColor { get }
    var feedbackColorWarning: UIColor { get }
}

public extension PunaColors {
    var tetColorLink: UIColor { return self.textColorLink }
}

/**
  PunaFonts is used to create a new StyleSheet
  implementing all the necessary fonts
*/
@objc public protocol PunaFonts {

    /**
      The default font variations that you need to override
      to use your own font through all the UI components.
      By default these return the SF system font
    */
    func titleXL(color: UIColor) -> PunaFontStyle
    func titleL(color: UIColor) -> PunaFontStyle
    func titleM(color: UIColor) -> PunaFontStyle
    func titleS(color: UIColor) -> PunaFontStyle
    func titleXS(color: UIColor) -> PunaFontStyle

    func bodyL(color: UIColor) -> PunaFontStyle
    func bodyM(color: UIColor) -> PunaFontStyle
    func bodyS(color: UIColor) -> PunaFontStyle
    func bodyXS(color: UIColor) -> PunaFontStyle

    func regularSystemFont(size: CGFloat) -> UIFont
    func lightSystemFont(size: CGFloat) -> UIFont
    func mediumSystemFontOfSize(size: CGFloat) -> UIFont
    func semiboldSystemFontOfSize(size: CGFloat) -> UIFont
}
