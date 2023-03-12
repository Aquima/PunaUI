//
//  
//  PunaMoneyAmountComboViewConfig.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 6/09/21.
//
//

import Foundation

/// used to define the ui of internal PunaMoneyAmountCombo views
internal struct PunaMoneyAmountComboViewConfig {
    var size: PunaMoneyAmountComboSize = .size24
    var moneyAmount: PunaMoneyAmount = PunaMoneyAmount()
    var discount: PunaMoneyAmountDiscount?
    var previous: PunaMoneyAmount?

    init() {}

    init(size: PunaMoneyAmountComboSize, moneyAmount: PunaMoneyAmount, discount: PunaMoneyAmountDiscount?, previous: PunaMoneyAmount?) {
        self.size = size
        self.moneyAmount = moneyAmount
        self.discount = discount
        self.previous = previous
    }
}
