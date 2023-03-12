//
//  PunaCardViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

/// used to define the ui of internal PunaCard views
internal struct PunaCardViewConfig {
    let backgroundColor: UIColor
    let pipeColor: UIColor
    let borderColor: UIColor?
    let padding: UInt
    let bodyPadding: UInt
    let titlePadding: UInt
    let titleHeight: UInt
    let shadow: PunaCardShadowConfig?
    let hasCardAction: Bool

    let titleText: String?
    var linkText: String?
    let cardView: UIView

    init(backgroundColor: UIColor, pipeColor: UIColor, borderColor: UIColor?, padding: UInt, bodyPadding: UInt, titlePadding: UInt, titleHeight: UInt, shadow: PunaCardShadowConfig?, hasCardAction: Bool, titleText: String?, linkText: String?, cardView: UIView) {
        self.backgroundColor = backgroundColor
        self.pipeColor = pipeColor
        self.borderColor = borderColor
        self.padding = padding
        self.bodyPadding = bodyPadding
        self.titlePadding = titlePadding
        self.titleHeight = titleHeight
        self.shadow = shadow
        self.hasCardAction = hasCardAction
        self.titleText = titleText
        self.linkText = linkText
        self.cardView = cardView
    }

    init() {
        self.backgroundColor = .clear
        self.pipeColor = .clear
        self.borderColor = nil
        self.padding = 0
        self.bodyPadding = 0
        self.titlePadding = 16
        self.titleHeight = 40
        self.shadow = nil
        self.hasCardAction = false
        self.titleText = nil
        self.linkText = nil
        self.cardView = UIView()
    }
}
