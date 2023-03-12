//
//  PunaCardTypeFactory.swift
//  PunaUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal class PunaCardTypeFactory {
    static func provide(_ type: PunaCardType) -> PunaCardTypeProtocol {
        switch type {
        case .none:
            return PunaCardTypeNone()
        case .highlight:
            return PunaCardTypeHighlight()
        case .error:
            return PunaCardTypeError()
        case .success:
            return PunaCardTypeSuccess()
        case .warning:
            return PunaCardTypeWarning()
        }
    }
}
