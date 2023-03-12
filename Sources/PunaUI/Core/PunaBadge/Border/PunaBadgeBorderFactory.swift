//
//  PunaBadgeBorderFactory.swift
//  PunaUI
//

class PunaBadgeBorderFactory {
    static func provide(_ border: PunaBadgeBorder) -> PunaBadgeBorderProtocol {
        switch border {
        case .standard:
            return PunaBadgeBorderStandard()
        case .corner:
            return PunaBadgeBorderCorner()
        case .rounded:
            return PunaBadgeBorderRounded()
        }
    }
}
