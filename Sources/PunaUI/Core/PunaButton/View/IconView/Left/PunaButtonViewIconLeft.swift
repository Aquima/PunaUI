//
//  PunaButtonLargeLeftIcon.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation

/**
 PunaButtonViewIconLeft is the representation for an PunaButton that has an icon on the left, its unique responsability is to load the view representation
 */
internal class PunaButtonViewIconLeft: PunaButtonViewWithIcon {

    override internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaButtonViewIconLeft", owner: self, options: nil)
    }
}
