//
//  PunaButtonDefaultView.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation
import UIKit
/**
 PunaButtonViewDefault is the default representation for an PunaButton, its unique responsability is to provide the size attributes to its contraints
 */
internal class PunaButtonViewDefault: PunaButtonAbstractView {

    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var leadingConstraint: NSLayoutConstraint!

    override internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaButtonViewDefault", owner: self, options: nil)
    }

    override internal func setupSize() {
        super.setupSize()

        heightConstraint.constant = config.height
        leadingConstraint.constant = config.padding
        trailingConstraint.constant = config.padding
    }

}
