//
//  PunaCarouselModeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 29/03/2021.
//

import Foundation

class PunaCarouselModeFactory {
    static func provide(_ type: PunaCarouselMode) -> PunaCarouselModeProtocol {
        switch type {
        case .free:
            return PunaCarouselModeFree()
        case .snapped:
            return PunaCarouselModeSnapped()
        }
    }
}
