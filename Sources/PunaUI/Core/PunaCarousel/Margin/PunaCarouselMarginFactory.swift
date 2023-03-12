//
//  PunaCarouselMarginFactory.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 08/02/2021.
//

import Foundation

class PunaCarouselMarginFactory {
    static func provide(_ type: PunaCarouselMargin) -> PunaCarouselMarginProtocol {
        switch type {
        case .none:
            return PunaCarouselMarginNone()
        case .defaultMargin:
            return PunaCarouselMarginDefault()
        case .compactMargin:
            return PunaCarouselCompactMargin()
        }
    }
}
