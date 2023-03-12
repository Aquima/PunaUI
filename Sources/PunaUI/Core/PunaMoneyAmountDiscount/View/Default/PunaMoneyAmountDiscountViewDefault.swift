//
//  
//  PunaDiscountViewDefault.swift
//  PunaUI
//
//  Created by Ana Cristina Calderon Castrillon on 1/09/21.
//
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
