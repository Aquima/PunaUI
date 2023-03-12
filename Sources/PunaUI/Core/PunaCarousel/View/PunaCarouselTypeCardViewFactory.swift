//
//  PunaCarouselTypeCardViewFactory.swift
//  PunaUI
//
//  Created by Robert Bevilacqua on 03/06/2021.
//

import UIKit

class PunaCarouselTypeCardViewFactory {
    static func provide(for config: PunaCarouselViewConfig, view: PunaCarousel) -> PunaCarouselView {
        switch config.marginMode {
        case .defaultMargin:
            return PunaCarouselDefaultWidthView(withConfig: config, delegate: view)
        case .compactMargin:
            return PunaCarouselCompactView(withConfig: config, delegate: view)
        default:
            return PunaCarouselFullWidthView(withConfig: config, delegate: view)
        }
    }
}
