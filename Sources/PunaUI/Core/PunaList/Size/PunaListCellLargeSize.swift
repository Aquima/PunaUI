//
//  PunaListCellLargeSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

struct PunaListCellLargeSize: PunaListCellSizeProtocol {
    var font = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary,
                              font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: PunaFontSize.bodyL),
                              lineSpacing: 5,
                              fontLineHeight: 22)
    var fontDescription = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorSecondary,
                              font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: PunaFontSize.bodyM),
                              lineSpacing: 5,
                              fontLineHeight: 20)
    var height: CGFloat = 68
    var paddingLeft: CGFloat = 24
    var paddingRight: CGFloat = 24
    var paddingTop: CGFloat = 23
    var paddingBottom: CGFloat = 23
    var descriptionHeight: CGFloat = 0
    var separatorHeight: CGFloat = 0
    var titleHeight: CGFloat = 12
    var chevronSize: CGFloat? = 24
    var thumbnailSize: CGFloat? = 0
    var separatorThumbnailWidth: CGFloat? = 0
    var paddingTopThumbnail: CGFloat?
    var paddingBottomThumbnail: CGFloat?
    var paddingBottomChevron: CGFloat? = 26
    var paddingTopChevron: CGFloat? = 26
    var separatorChevronWidth: CGFloat? = 12

    init(subTitleIsEmpty: Bool, thumbnail: PunaThumbnail? = nil) {
        if !subTitleIsEmpty {
            height = 96
            paddingBottom = 24
            descriptionHeight = 20
            separatorHeight = 6
        }
        if let thumbnail = thumbnail {
            switch thumbnail.type {
            case .icon:
                thumbnailSize = 24
                separatorThumbnailWidth = 16
                paddingTopThumbnail = 27
            case .imageCircle, .imageSquare:
                height = 96
                thumbnailSize = 56
                separatorThumbnailWidth = 16
                paddingTopThumbnail = 24
                paddingBottomThumbnail = 24
                paddingTopChevron = 40
                paddingBottomChevron = 40
            }
        }
    }

}
