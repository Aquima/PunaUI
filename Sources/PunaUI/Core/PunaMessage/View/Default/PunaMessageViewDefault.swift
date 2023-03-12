//
//  PunaMessageViewDefault.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaMessageDefaultView: PunaMessageAbstractView {
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaMessageDefaultView", owner: self, options: nil)
    }
}
