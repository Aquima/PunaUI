//
//  PunaMessageTypeFactory.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
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
