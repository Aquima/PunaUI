//
//  PunaButtonLargeRightIcon.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/**
PunaButtonViewIconLeft is the representation for an PunaButton that has an icon on the right, its unique responsability is to load the view representation
*/
internal class PunaButtonViewIconRight: PunaButtonViewWithIcon {

    override internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaButtonViewIconRight", owner: self, options: nil)
    }
}
