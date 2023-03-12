//
//  PunaFontStyle.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 05/12/2019.
//

import Foundation
import UIKit

@objc public class PunaFontStyle: NSObject {
    @objc public private(set) var textColor: UIColor
    @objc public private(set) var font: UIFont
    @objc public private(set) var lineSpacing: CGFloat
    @objc public private(set) var fontLineHeight: CGFloat = 0

    @available(*, deprecated, renamed: "lineSpacing")
    @objc public private(set) var lineHeight: CGFloat {
        get {
            return lineSpacing
        }
        set {
            lineSpacing = newValue
        }
    }

    @available(*, deprecated, message: "Please use init with init(textColor:font:lineSpacing:)' instead")
    @objc public init(textColor: UIColor, font: UIFont, lineHeight: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineSpacing = lineHeight
    }

    @objc public init(textColor: UIColor, font: UIFont, lineSpacing: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineSpacing = lineSpacing
    }

    // TODO improve !! cuando se fix fontStyle
    @objc public init(textColor: UIColor, font: UIFont, lineSpacing: CGFloat, fontLineHeight: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineSpacing = lineSpacing
        self.fontLineHeight = fontLineHeight
    }

    /// Init an PunaFontStyle with a sketch line height
    /// - Parameters:
    ///   - textColor: Font Color
    ///   - font: font (with sketch size)
    ///   - sketchLineHeight: line height
    @objc public init(textColor: UIColor, font: UIFont, sketchLineHeight: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineSpacing = sketchLineHeight - font.lineHeight
    }
}

@objc public class PunaFontSize: NSObject {
    @objc public static let titleXL: CGFloat = 32
    @objc public static let titleL: CGFloat = 28
    @objc public static let titleM: CGFloat = 24
    @objc public static let titleS: CGFloat = 20
    @objc public static let titleXS: CGFloat = 18

    @objc public static let bodyL: CGFloat = 18
    @objc public static let bodyM: CGFloat = 16
    @objc public static let bodyS: CGFloat = 14
    @objc public static let bodyXS: CGFloat = 12
}
