//
//  
//  PunaMoneyAmountComboViewDefault.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaMoneyAmountComboViewDefault: PunaMoneyAmountComboAbstractView {
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaMoneyAmountComboViewDefault", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
    }
}
