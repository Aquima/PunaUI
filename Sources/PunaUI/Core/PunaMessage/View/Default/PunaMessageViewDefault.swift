//
//  PunaMessageViewDefault.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/15/20.
//

import Foundation

class PunaMessageDefaultView: PunaMessageAbstractView {
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaMessageDefaultView", owner: self, options: nil)
    }
}
