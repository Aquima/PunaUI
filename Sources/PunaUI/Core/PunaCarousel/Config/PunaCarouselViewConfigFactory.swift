//
//  PunaCarouselViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/**
The responsability of the factory is to provide the ViewConfig from the user specified attributes
*/
internal class PunaCarouselViewConfigFactory {

    static func provide(for carousel: PunaCarousel) -> PunaCarouselViewConfig {

        let title = carousel.title ?? String()
        let marginConfig = PunaCarouselMarginFactory.provide(carousel.margin)
        let mode = PunaCarouselModeFactory.provide(carousel.mode)
        let showPageControl = carousel.usePaginator && mode.centered
        return PunaCarouselViewConfig(title: title, margin: CGFloat(marginConfig.margin), cellSpacing: marginConfig.cellSpacing, centerScroll: mode.centered, usePaginator: showPageControl, marginMode: marginConfig.marginMode)
    }
}
