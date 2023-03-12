//
//  
//  PunaSliderViewDefault.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaSliderViewDefault: PunaSliderAbstractView {
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaSliderAbstractView", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
    }
}
