//
//  
//  PunaDiscountViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// used to define the ui of internal PunaDiscount views
internal struct PunaMoneyAmountDiscountViewConfig {
    var discountValue: Int?
    var size: PunaMoneyAmountSize?
    init() {}

    init(discountValue: Int, size: PunaMoneyAmountSize) {
        self.discountValue = discountValue
        self.size = size
    }
}
