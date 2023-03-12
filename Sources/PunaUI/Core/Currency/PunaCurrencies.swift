//
//  PunaCurrencies.swift
//  PunaUI-PunaUIResources
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

@objc public protocol PunaCurrencies {
    var currencies: [String: PunaCurrencyInfo] { get }
    var sites: [String: PunaSiteInfo] { get }
    var currentSite: String { get }
}

@objc public class PunaCurrencyInfo: NSObject {
    var decimalSeparator: String
    var thousandSeparator: String
    var symbol: String
    var decimalPlaces: String
    var decimalName: String
    var currencyName: String
    var decimalNamePrural: String
    var currencyNamePrural: String

    public init(decimalSeparator: String, thousandSeparator: String, symbol: String, decimalPlaces: String, decimalName: String, currencyName: String, decimalNamePrural: String, currencyNamePrural: String) {
        self.decimalSeparator = decimalSeparator
        self.thousandSeparator = thousandSeparator
        self.symbol = symbol
        self.decimalPlaces = decimalPlaces
        self.decimalName = decimalName
        self.currencyName = currencyName
        self.decimalNamePrural = decimalNamePrural
        self.currencyNamePrural = currencyNamePrural
    }
}

@objc public class PunaSiteInfo: NSObject {
    var decimalSeparator: String
    var thousandSeparator: String

    public init(decimalSeparator: String, thousandSeparator: String) {
        self.decimalSeparator = decimalSeparator
        self.thousandSeparator = thousandSeparator
    }
}

extension PunaCurrencyInfo {
    func currencyInfoWith(formatedCountry: PunaCountry?) -> PunaCurrencyInfo {

        let currentSite = PunaCurrenciesManager.currencies.currentSite
        let PunaCountry = formatedCountry ?? PunaCountry.init(from: currentSite)

        guard let currentSiteCountry = PunaCountry,
              let decimalSeparator = PunaCurrenciesManager.currencies.sites[currentSiteCountry.toString()]?.decimalSeparator,
              let thousandsSeparator = PunaCurrenciesManager.currencies.sites[currentSiteCountry.toString()]?.thousandSeparator
        else { return self}

        return PunaCurrencyInfo(decimalSeparator: decimalSeparator,
                                 thousandSeparator: thousandsSeparator,
                                 symbol: self.symbol,
                                 decimalPlaces: self.decimalPlaces,
                                 decimalName: self.decimalName,
                                 currencyName: self.currencyName,
                                 decimalNamePrural: self.decimalNamePrural, currencyNamePrural: self.currencyNamePrural)

    }
}
