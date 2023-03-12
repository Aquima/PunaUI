//
//  PunaCurrenciesTestAppDefault.swift
//  PunaUI-PunaUIResources
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

@objc public class PunaCurrenciesDefault: NSObject, PunaCurrencies {
    public var currentSite = PunaCountry.DEFAULT.toString()

    public var currencies: [String: PunaCurrencyInfo] = [
        "ARS": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "$", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Peso", decimalNamePrural: "Centavo", currencyNamePrural: "Pesos"),
        "BRL": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "R$", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Real", decimalNamePrural: "Centavos", currencyNamePrural: "Reales"),
        "CLP": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "$", decimalPlaces: "0", decimalName: "Centavo", currencyName: "Peso", decimalNamePrural: "Centavos", currencyNamePrural: "Pesos"),
        "COP": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "$", decimalPlaces: "0", decimalName: "Centavo", currencyName: "Peso", decimalNamePrural: "Centavos", currencyNamePrural: "Pesos"),
        "CRC": PunaCurrencyInfo(decimalSeparator: ".", thousandSeparator: ",", symbol: "¢", decimalPlaces: "2", decimalName: "Céntimo", currencyName: "Colón", decimalNamePrural: "Céntimos", currencyNamePrural: "Colónes"),
        "DOP": PunaCurrencyInfo(decimalSeparator: ".", thousandSeparator: ",", symbol: "$", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Peso", decimalNamePrural: "Centavos", currencyNamePrural: "Pesos"),
        "EUR": PunaCurrencyInfo(decimalSeparator: ".", thousandSeparator: ",", symbol: "€", decimalPlaces: "2", decimalName: "Cent", currencyName: "Euro", decimalNamePrural: "Cents", currencyNamePrural: "Euros"),
        "MXN": PunaCurrencyInfo(decimalSeparator: ".", thousandSeparator: ",", symbol: "$", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Peso", decimalNamePrural: "Centavos", currencyNamePrural: "Pesos"),
        "PAB": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "B/.", decimalPlaces: "2", decimalName: "Centésimo", currencyName: "Balboa", decimalNamePrural: "Centésimos", currencyNamePrural: "Balboas"),
        "PEN": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "S/", decimalPlaces: "2", decimalName: "Céntimo", currencyName: "Sol", decimalNamePrural: "Céntimos", currencyNamePrural: "Soles"),
        "USD": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "U$S", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Dolar", decimalNamePrural: "Centavos", currencyNamePrural: "Dolares"),
        "UYU": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "$", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Peso", decimalNamePrural: "Centavos", currencyNamePrural: "Pesos"),
        "VEF": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "Bs.", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Bolivar", decimalNamePrural: "Centavos", currencyNamePrural: "Bolívares"),
        "VES": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "Bs.", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Bolivar", decimalNamePrural: "Centavos", currencyNamePrural: "Bolívares"),
        "CLF": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "UF", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Unidad de fomento", decimalNamePrural: "Centavos", currencyNamePrural: "Unidades de fomento"),
        "BOB": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "Bs", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Boliviano", decimalNamePrural: "Centavos", currencyNamePrural: "Bolivianos"),
        "PYG": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "₲", decimalPlaces: "0", decimalName: "Céntimo", currencyName: "Guaraní", decimalNamePrural: "Céntimos", currencyNamePrural: "Guaraníes"),
        "GTQ": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "Q", decimalPlaces: "2", decimalName: "Centavo", currencyName: "Quetzal", decimalNamePrural: "Centavos", currencyNamePrural: "Quetzales"),
        "HNL": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "L", decimalPlaces: "0", decimalName: "Centavo", currencyName: "Lempira", decimalNamePrural: "Centavos", currencyNamePrural: "Lempiras"),
        "NIO": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "C$", decimalPlaces: "0", decimalName: "Centavo", currencyName: "Córdoba", decimalNamePrural: "Centavos", currencyNamePrural: "Córdobas"),
        "CUC": PunaCurrencyInfo(decimalSeparator: ",", thousandSeparator: ".", symbol: "$", decimalPlaces: "2", decimalName: "", currencyName: "Peso cubano convertible", decimalNamePrural: "", currencyNamePrural: "Pesos cubanos convertibles")
        ]

    public var sites: [String: PunaSiteInfo] = [
        "MNI": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MLC": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MLV": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MHN": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MPY": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MBO": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MLU": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MCR": PunaSiteInfo(decimalSeparator: ".", thousandSeparator: ","),
        "MLM": PunaSiteInfo(decimalSeparator: ".", thousandSeparator: ","),
        "MSV": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MGT": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MPA": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MRD": PunaSiteInfo(decimalSeparator: ".", thousandSeparator: ","),
        "MLA": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MCO": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MPE": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MPR": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MCU": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MLB": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: "."),
        "MEC": PunaSiteInfo(decimalSeparator: ",", thousandSeparator: ".")]
}
