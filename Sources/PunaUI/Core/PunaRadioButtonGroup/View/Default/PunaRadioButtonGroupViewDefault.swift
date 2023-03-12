//
//  
//  PunaRadioButtonGroupViewDefault.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 10/06/21.
//
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
