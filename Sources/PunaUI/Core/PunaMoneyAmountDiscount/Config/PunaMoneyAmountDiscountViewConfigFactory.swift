//
//  
//  PunaDiscountViewConfigFactory.swift
//  PunaUI
//
//  Created by Ana Cristina Calderon Castrillon on 1/09/21.
//
//

import Foundation

internal class PunaMoneyAmountDiscountViewConfigFactory {
    static func provideInternalConfig(discountValue: Int, size: PunaMoneyAmountSize) -> PunaMoneyAmountDiscountViewConfig {
        let config = PunaMoneyAmountDiscountViewConfig(discountValue: discountValue, size: size)
        return config
    }
}
