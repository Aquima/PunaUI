//
//  
//  PunaMoneyAmountComboViewDefault.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 6/09/21.
//
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
