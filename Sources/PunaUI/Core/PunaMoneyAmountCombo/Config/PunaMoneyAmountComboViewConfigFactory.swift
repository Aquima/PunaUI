//
//  
//  PunaMoneyAmountComboViewConfigFactory.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 6/09/21.
//
//

import Foundation

internal class PunaMoneyAmountComboViewConfigFactory {
    static func provideInternalConfig(size: PunaMoneyAmountComboSize, price: Double, discount: Int, previousPricePrice: Double?, currency: PunaMoneyAmountCurrency) -> PunaMoneyAmountComboViewConfig {

        var punaMoneyAmountDiscount: PunaMoneyAmountDiscount?
        var punaMoneyAmountPrevious: PunaMoneyAmount?

        if discount != 0 {
            punaMoneyAmountDiscount = PunaMoneyAmountDiscount(discountValue: discount, size: size == .size24 ? .size14 : .size18)
        }

        if let previousPricePrice = previousPricePrice {
            punaMoneyAmountPrevious = PunaMoneyAmount(type: .previous, size: size == .size24 ? .size12 : .size16, currency: currency, decimalStyle: .normal, amount: previousPricePrice < 0 ? abs(previousPricePrice) : previousPricePrice)
        }

        let punaMoneyAmount = PunaMoneyAmount(type: .positive, size: size == .size24 ? .size24 : .size36, currency: currency, decimalStyle: .normal, amount: price)

        let config = PunaMoneyAmountComboViewConfig(
            size: size,
            moneyAmount: punaMoneyAmount,
            discount: punaMoneyAmountDiscount,
            previous: punaMoneyAmountPrevious)

        return config
    }
}
