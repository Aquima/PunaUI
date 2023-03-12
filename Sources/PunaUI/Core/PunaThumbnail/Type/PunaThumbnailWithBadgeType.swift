//
//  PunaThumbnailBadgeType.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaThumbnailWithBadgeType: Int, PunaEnumStringConvertible {
    case icon
    case imageCircle

    public static func keyFor(_ value: PunaThumbnailWithBadgeType) -> String {
        switch value {
        case .icon: return "ICON"
        case .imageCircle: return "IMAGE_CIRCLE"
        }
    }

    func thumbnailType() -> PunaThumbnailType {
        switch self {
        case .icon:
            return .icon
        case .imageCircle:
            return .imageCircle
        }
    }
}
