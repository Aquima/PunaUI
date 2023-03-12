//
//  PunaCarouselMargin.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/**
The PunaCarouselMargin contains the differents margins that a Carousel supports
*/
@objc public enum PunaCarouselMargin: Int, PunaEnumStringConvertible {
    case none
    case defaultMargin
    case compactMargin

    public static func keyFor(_ value: PunaCarouselMargin) -> String {
        switch value {
        case .none: return "NONE"
        case .defaultMargin: return "DEFAULT"
        case .compactMargin: return "COMPACT"
        }
    }
}
