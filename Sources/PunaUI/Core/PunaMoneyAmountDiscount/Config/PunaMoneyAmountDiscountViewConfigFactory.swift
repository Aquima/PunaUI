//
//  
//  PunaDiscountViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

internal class PunaMoneyAmountDiscountViewConfigFactory {
    static func provideInternalConfig(discountValue: Int, size: PunaMoneyAmountSize) -> PunaMoneyAmountDiscountViewConfig {
        let config = PunaMoneyAmountDiscountViewConfig(discountValue: discountValue, size: size)
        return config
    }
}
