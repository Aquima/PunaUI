//
//  PunaMoneyAmountDiscountCurrencyInfo.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc
protocol PunaMoneyAmountCurrencyInfo {
    var decimalSeparator: String { get }
    var thousandsSeparator: String { get }
    var currencySimbol: String { get }
    var decimalPlaces: Int { get }
}
