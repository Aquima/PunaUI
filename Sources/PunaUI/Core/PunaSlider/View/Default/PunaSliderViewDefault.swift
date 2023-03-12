//
//  
//  PunaSliderViewDefault.swift
//  PunaUI
//
//  Created by Victor Chang on 25/02/2021.
//
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
