//
//  PunaBadgeTypeFactory.swift
//  PunaUI
//

import Foundation

class PunaBadgeTypeFactory {
    static func provide(_ type: PunaBadgeType) -> PunaBadgeTypeProtocol {
        switch type {
        case .neutral:
            return PunaBadgeTypeNeutral()
        case .highlight:
            return PunaBadgeTypeHighlight()
        case .success:
            return PunaBadgeTypeSuccess()
        case .warning:
            return PunaBadgeTypeWarning()
        case .error:
            return PunaBadgeTypeError()
        }
    }
}
