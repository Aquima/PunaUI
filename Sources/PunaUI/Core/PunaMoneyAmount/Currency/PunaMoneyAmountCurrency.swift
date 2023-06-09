//
//  PunaMoneyAmountCurrency.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
/// Used to set the MoneyAmoun currency
@objc public enum PunaMoneyAmountCurrency: Int, PunaEnumStringConvertible {
    case BRL
    case UYU
    case CLP
    case CLF
    case MXN
    case DOP
    case PAB
    case COP
    case VEF
    case EUR
    case PEN
    case CRC
    case ARS
    case USD
    case BOB
    case GTQ
    case PYG
    case HNL
    case NIO
    case CUC
    case VES

    public static func keyFor(_ value: PunaMoneyAmountCurrency) -> String {
        switch value {
        case .BRL:
            return "BRL"
        case .UYU:
            return "UYU"
        case .CLP:
            return "CLP"
        case .CLF:
            return "CLF"
        case .MXN:
            return "MXN"
        case .DOP:
            return "DOP"
        case .PAB:
            return "PAB"
        case .COP:
            return "COP"
        case .VEF:
            return "VEF"
        case .EUR:
            return "EUR"
        case .PEN:
            return "PEN"
        case .CRC:
            return "CRC"
        case .ARS:
            return "ARS"
        case .USD:
            return "USD"
        case .BOB:
            return "BOB"
        case .GTQ:
            return "GTQ"
        case .PYG:
            return "PYG"
        case .HNL:
            return "HNL"
        case .NIO:
            return "NIO"
        case .CUC:
            return "CUC"
        case .VES:
            return "VES"
        }
    }
}

extension PunaMoneyAmountCurrency {
    init?(_ value: String) {
        switch value {
        case "BRL": self = .BRL
        case "UYU": self = .UYU
        case "CLP": self = .CLP
        case "CLF": self = .CLF
        case "MXN": self = .MXN
        case "DOP": self = .DOP
        case "PAB": self = .PAB
        case "COP": self = .COP
        case "VEF": self = .VEF
        case "EUR": self = .EUR
        case "PEN": self = .PEN
        case "CRC": self = .CRC
        case "ARS": self = .ARS
        case "USD": self = .USD
        case "BOB": self = .BOB
        case "GTQ": self = .GTQ
        case "PYG": self = .PYG
        case "HNL": self = .HNL
        case "NIO": self = .NIO
        case "CUC": self = .CUC
        case "VES": self = .VES
        default: return nil
        }
    }
}
