//
//  PunaBadgeSizeFactory.swift
//  PunaUI
//

class PunaBadgeSizeFactory {
    static func provide(_ type: PunaBadgeSize) -> PunaBadgeSizeProtocol {
        switch type {
        case .large:
            return PunaBadgeSizeLarge()
        case .small:
            return PunaBadgeSizeSmall()
        }
    }
}
