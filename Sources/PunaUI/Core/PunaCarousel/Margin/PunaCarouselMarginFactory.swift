//
//  PunaCarouselMarginFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
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
