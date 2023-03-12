//
//  PunaListCellSizeFactory.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 5/11/20.
//

import Foundation

class PunaListCellSizeFactory {
    static func provideSize(withSize size: PunaListSize,
                        subTitleIsEmpty: Bool, thumbnail: PunaThumbnail? = nil) -> PunaListCellSizeProtocol {
        switch size {
        case .large:
            return PunaListCellLargeSize(subTitleIsEmpty: subTitleIsEmpty, thumbnail: thumbnail)
        case .small:
            return PunaListCellSmallSize(withThumbnail: thumbnail)
        case .medium:
            return PunaListCellMediumSize(subTitleIsEmpty: subTitleIsEmpty, thumbnail: thumbnail)
        }
    }
}
