//
//  PunaButtonLargeWithIcon.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation
import UIKit
/**
 PunaButtonViewDefault is the representation for an PunaButton that has an icon, its unique responsability is carry an icon and draw it
 */
internal class PunaButtonViewWithIcon: PunaButtonAbstractView {

    @IBOutlet var icon: UIImageView!

    override internal func setupStyle() {
        super.setupStyle()

        icon.image = config.icon!.withRenderingMode(.alwaysTemplate)
        icon.highlightedImage = config.icon!.withRenderingMode(.alwaysTemplate)
        icon.tintColor = config.iconColor
    }

    override func disable() {
        super.disable()
        icon.tintColor = config.iconDisableColor
    }

    override func enable() {
        super.enable()
        icon.tintColor = config.iconColor
    }
}
