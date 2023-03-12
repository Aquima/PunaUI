//
//  PunaBadgeSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
/**
 The PunaBadgeSize contains the differents sizes that a badge supports
 */
@objc public enum PunaBadgeSize: Int, PunaEnumStringConvertible {
    case small
    case large

    public static func keyFor(_ value: PunaBadgeSize) -> String {
        switch value {
        case .small: return "SMALL"
        case .large: return "LARGE"
        }
    }
}
