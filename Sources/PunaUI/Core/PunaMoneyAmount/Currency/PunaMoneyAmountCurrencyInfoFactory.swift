//
//  PunaMoneyAmountPriceCurrencyInfoFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaMoneyAmountCurrencyInfoObject {
    static func currencyInfoWith(_ currency: PunaCurrencyInfo, formatedCountry: PunaCountry) -> PunaCurrencyInfo? {

        let currentSite = PunaCurrenciesManager.currencies.currentSite
        let PunaCountry = formatedCountry == .DEFAULT ? PunaCountry.init(from: currentSite) : formatedCountry

        guard let currentSiteCountry = PunaCountry,
              let decimalSeparator = PunaCountry == .DEFAULT ? currency.decimalSeparator : PunaCurrenciesManager.currencies.sites[currentSiteCountry.toString()]?.decimalSeparator,
              let thousandsSeparator = PunaCountry == .DEFAULT ? currency.thousandSeparator : PunaCurrenciesManager.currencies.sites[currentSiteCountry.toString()]?.thousandSeparator
        else { return nil}

        return PunaCurrencyInfo(decimalSeparator: decimalSeparator,
                                 thousandSeparator: thousandsSeparator,
                                 symbol: currency.symbol,
                                 decimalPlaces: currency.decimalPlaces,
                                 decimalName: currency.decimalName,
                                 currencyName: currency.currencyName,
                                 decimalNamePrural: currency.decimalNamePrural, currencyNamePrural: currency.currencyNamePrural)

    }
}
