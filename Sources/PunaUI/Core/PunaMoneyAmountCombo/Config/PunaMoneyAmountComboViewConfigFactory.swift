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

        var PunaMoneyAmountDiscount: PunaMoneyAmountDiscount?
        var PunaMoneyAmountPrevious: PunaMoneyAmount?

        if discount != 0 {
            PunaMoneyAmountDiscount = PunaMoneyAmountDiscount(discountValue: discount, size: size == .size24 ? .size14 : .size18)
        }

        if let previousPricePrice = previousPricePrice {
            PunaMoneyAmountPrevious = PunaMoneyAmount(type: .previous, size: size == .size24 ? .size12 : .size16, currency: currency, decimalStyle: .normal, amount: previousPricePrice < 0 ? abs(previousPricePrice) : previousPricePrice)
        }

        let PunaMoneyAmount = PunaMoneyAmount(type: .positive, size: size == .size24 ? .size24 : .size36, currency: currency, decimalStyle: .normal, amount: price)

        let config = PunaMoneyAmountComboViewConfig(
            size: size,
            moneyAmount: PunaMoneyAmount,
            discount: PunaMoneyAmountDiscount,
            previous: PunaMoneyAmountPrevious)

        return config
    }
}
