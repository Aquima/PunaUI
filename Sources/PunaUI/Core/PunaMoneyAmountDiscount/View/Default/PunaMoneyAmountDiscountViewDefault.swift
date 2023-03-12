//
//  
//  PunaDiscountViewDefault.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaMoneyAmountDiscountViewDefault: PunaMoneyAmountDiscountAbstractView {

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaDiscountViewDefault", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
    }
}
