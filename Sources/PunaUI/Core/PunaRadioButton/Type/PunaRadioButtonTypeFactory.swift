//
//  PunaRadioButtonTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaRadioButtonTypeFactory {
    static func provide(_ type: PunaRadioButtonType, status: PunaRadioButtonStatus) -> PunaRadioButtonTypeProtocol {
        switch type {
        case .disabled:
            return PunaRadioButtonTypeDisabled()
        case .idle:
            return PunaRadioButtonTypeIdle(status: status)
        case .error:
            return PunaRadioButtonTypeError()
        }
    }
}
