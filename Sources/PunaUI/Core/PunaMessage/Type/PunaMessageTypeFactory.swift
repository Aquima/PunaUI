//
//  PunaMessageTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
class PunaMessageTypeFactory {
    static func provide(_ type: PunaMessageType) -> PunaMessageTypeProtocol {
        switch type {
        case .neutral:
            return PunaMessageTypeHightlight()
        case .warning:
            return PunaMessageTypeWarning()
        case .error:
            return PunaMessageTypeError()
        case .success:
            return PunaMessageTypeSuccess()
        }
    }
}
