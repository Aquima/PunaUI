//
//  
//  PunaMoneyAmountViewConfigFactory.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 24/08/21.
//
//

import Foundation

internal class PunaMoneyAmountViewConfigFactory {
    static func provideInternalConfig(type: PunaMoneyAmountType, currencyInfo: PunaCurrencyInfo, size: PunaMoneyAmountSize, decimalStyle: PunaMoneyAmountDecimalStyle, amount: Double?, showZerosDecimal: Bool) -> PunaMoneyAmountViewConfig {
        let amount = amount ?? 0
        let amountFormated = "\(currencyInfo.symbol) \(PunaMoneyAmountCurrencyFactory.provide(currencyInfo, decimalStyle, amount: amount < 0 ? abs(amount) : amount, showZerosDecimal: showZerosDecimal))"

        func getSizeFor(_ size: PunaMoneyAmountSize, isForSuperScript: Bool) -> CGFloat {
            let sizeString = PunaMoneyAmountSize.keyFor(size)

            if isForSuperScript, decimalStyle == .superScript {
                let superScriptSize = PunaMoneyAmountSize.superScriptSizeFor(size)
                return superScriptSize
            }

            guard let size = NumberFormatter().number(from: sizeString) else {return 0.0}

            return CGFloat(truncating: size)
        }

        let config = PunaMoneyAmountViewConfig(type: type, decimalStyle: decimalStyle, decimalSeparator: currencyInfo.decimalSeparator, amount: amountFormated, labelSize: getSizeFor(size, isForSuperScript: false), superScripSize: getSizeFor(size, isForSuperScript: true))

        return config
    }
}
