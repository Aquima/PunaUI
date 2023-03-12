//
//  PunaBadgeSizeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
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
