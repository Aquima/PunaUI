//
//  PunaCheckboxTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/16/20.
//

import Foundation

class PunaCheckboxTypeFactory {
    static func provide(_ type: PunaCheckboxType, status: PunaCheckboxStatus) -> PunaCheckboxTypeProtocol {
        switch type {
        case .disabled:
            return PunaCheckboxTypeDisabled(status: status)
        case .idle:
            return PunaCheckboxTypeIdle(status: status)
        case .error:
            return PunaCheckboxTypeError()
        }
    }
}
