//
//  PunaCarouselMode.swift
//  PunaUI
//
//  Created by Raul Quispe on 29/03/2021.
//

import Foundation

/**
The PunaCarouselMode contains the differents modes that a Carousel supports
*/
@objc public enum PunaCarouselMode: Int, PunaEnumStringConvertible {
    case free
    case snapped

    public static func keyFor(_ value: PunaCarouselMode) -> String {
        switch value {
        case .free: return "FREE"
        case .snapped: return "SNAPPED"
        }
    }
}
