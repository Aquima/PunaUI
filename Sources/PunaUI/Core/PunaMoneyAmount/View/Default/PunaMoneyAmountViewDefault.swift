//
//  
//  PunaMoneyAmountDiscountViewDefault.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 24/08/21.
//
//

import Foundation

class PunaMoneyAmountViewDefault: PunaMoneyAmountAbstractView {
    override func loadNib() {
        PunaBundle.bundle().loadNibNamed("PunaMoneyAmountViewDefault", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
    }
}
