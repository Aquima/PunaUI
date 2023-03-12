//
//  
//  PunaMoneyAmountDiscountViewDefault.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
