//
//  PunaListCellSizeFactory.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation
import UIKit

class PunaListCellFactory {
    static func provide(withSize size: PunaListSize,
                        subTitleIsEmpty: Bool, thumbnail: PunaThumbnail? = nil) -> PunaListCellConfig {

        let cellSize = PunaListCellSizeFactory.provideSize(withSize: size, subTitleIsEmpty: subTitleIsEmpty, thumbnail: thumbnail)
        let cellType = PunaListCellTypeFactory.provideType(withthumbnail: thumbnail)

        return PunaListCellConfig(font: cellSize.font,
                                   fontDescription: cellSize.fontDescription,
                                   height: cellSize.height,
                                   paddingLeft: cellSize.paddingLeft,
                                   paddingRight: cellSize.paddingRight,
                                   paddingTop: cellSize.paddingTop,
                                   paddingBottom: cellSize.paddingBottom,
                                   descriptionHeight: cellSize.descriptionHeight,
                                   separatorHeight: cellSize.separatorHeight,
                                   titleHeight: cellSize.titleHeight,
                                   chevronSize: cellSize.chevronSize,
                                   thumbnailSize: cellSize.thumbnailSize,
                                   separatorThumbnailWidth: cellSize.separatorThumbnailWidth,
                                   paddingTopThumbnail: cellSize.paddingTopThumbnail,
                                   paddingBottomThumbnail: cellSize.paddingBottomThumbnail,
                                   separatorChevronWidth: cellSize.separatorChevronWidth,
                                   paddingTopChevron: cellSize.paddingTopChevron,
                                   paddingBottomChevron: cellSize.paddingBottomChevron,
                                   chevronImage: cellType.chevronImage,
                                   thumbnailLeft: cellType.thumbnailLeft)
    }
}
