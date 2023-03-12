//
//  PunaTagTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaTagTypeFactory {
    static func provide(_ type: PunaTagType) -> PunaTagTypeProtocol {
        switch type {
        case .neutral:
            return PunaTagTypeNeutral()
        case .error:
            return PunaTagTypeError()
        case .highlight:
            return PunaTagTypeHighlight()
        case .warning:
            return PunaTagTypeWarning()
        case .success:
            return PunaTagTypeSuccess()
        }
    }
}
