//
//  PunaBadgeTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
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
