//
//  PunaCarouselTypeCardViewConfigFactory.swift
//  PunaUI
//
//  Created by Robert Bevilacqua on 03/06/2021.
//

import UIKit

class PunaCarouselTypeCardViewConfigFactory {

    static func getItemSize(with contentView: UIView, config: PunaCarouselViewConfig, indexPath: IndexPath) -> CGSize {
        let minimunViewMargin: CGFloat = 10
        var reduceHeight: CGFloat = minimunViewMargin * 2
        if config.title.isEmpty, config.usePaginator {
            reduceHeight += 5
        }
        let width = contentView.frame.width - config.margin * 2
        return CGSize(width: width, height: contentView.frame.height - reduceHeight)
    }

    static func getContentInset(with config: PunaCarouselViewConfig) -> UIEdgeInsets {
        let topConstraint: CGFloat = config.usePaginator || !config.title.isEmpty ? config.margin : 0
        return UIEdgeInsets(top: -topConstraint, left: config.margin, bottom: 0, right: config.margin)
    }

}
