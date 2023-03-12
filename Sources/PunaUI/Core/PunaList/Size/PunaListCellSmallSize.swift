//
//  PunaListCellSmallSize.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 5/11/20.
//

import Foundation

struct PunaListCellSmallSize: PunaListCellSizeProtocol {
    var font = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary,
                              font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: PunaFontSize.bodyS),
                              lineSpacing: 5,
                              fontLineHeight: 18)
    var fontDescription = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorSecondary,
                              font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: PunaFontSize.bodyXS),
                              lineSpacing: 5)
    var height: CGFloat = 40
    var paddingLeft: CGFloat = 16
    var paddingRight: CGFloat = 16
    var paddingTop: CGFloat = 11
    var paddingBottom: CGFloat = 11
    var descriptionHeight: CGFloat = 0
    var separatorHeight: CGFloat = 0
    var titleHeight: CGFloat = 9
    var chevronSize: CGFloat? = 12
    var thumbnailSize: CGFloat? = 0
    var separatorThumbnailWidth: CGFloat? = 0
    var paddingTopThumbnail: CGFloat?
    var paddingBottomThumbnail: CGFloat?
    var paddingBottomChevron: CGFloat? = 18
    var paddingTopChevron: CGFloat? = 18
    var separatorChevronWidth: CGFloat? = 12

    init(withThumbnail thumbnail: PunaThumbnail? = nil) {
        if let thumbnail = thumbnail {
            switch thumbnail.type {
            case .icon:
                thumbnailSize = 16
                separatorThumbnailWidth = 8
                paddingTopThumbnail = 16
            case .imageCircle, .imageSquare:
                height = 56
                thumbnailSize = 32
                separatorThumbnailWidth = 12
                paddingTopThumbnail = 12
                paddingBottomThumbnail = 12
                paddingTopChevron = 22
                paddingBottomChevron = 22
            }
        }
    }
}
