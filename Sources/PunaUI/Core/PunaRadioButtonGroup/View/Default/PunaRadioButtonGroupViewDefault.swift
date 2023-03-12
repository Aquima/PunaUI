//
//  
//  PunaRadioButtonGroupViewDefault.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaRadioButtonGroupViewDefault: PunaRadioButtonGroupAbstractView {
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaRadioButtonGroupViewDefault", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
    }
}
