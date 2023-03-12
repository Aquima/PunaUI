//
//  PunaMoneyAmountCurrencyFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaMoneyAmountCurrencyFactory {
    static func provide(_ currencyInfo: PunaCurrencyInfo, _ decimalStyle: PunaMoneyAmountDecimalStyle, amount: Double?, showZerosDecimal: Bool) -> String {
        var amounIntFormated: Int = 0

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = currencyInfo.decimalSeparator
        formatter.groupingSeparator = currencyInfo.thousandSeparator
        formatter.maximumFractionDigits = Int(currencyInfo.decimalPlaces) ?? 0

        if decimalStyle == .none {
            amounIntFormated = Int(amount ?? 0)
        }

        var formatedString = formatter.string(for: decimalStyle == .none ? amounIntFormated : amount) ?? "Invalid"

        if showZerosDecimal, !formatedString.contains(currencyInfo.decimalSeparator) {
            formatedString += "\(currencyInfo.decimalSeparator)00"
        }

        return formatedString
    }
}
