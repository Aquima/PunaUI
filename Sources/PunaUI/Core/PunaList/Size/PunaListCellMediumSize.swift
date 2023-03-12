//
//  PunaListCellMediumSize.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 5/11/20.
//

import Foundation

struct PunaListCellMediumSize: PunaListCellSizeProtocol {
    var font = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary,
                              font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: PunaFontSize.bodyM),
                              lineSpacing: 2,
                              fontLineHeight: 20)
    var fontDescription = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorSecondary,
                              font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: PunaFontSize.bodyS),
                              lineSpacing: 1,
                              fontLineHeight: 18)
    var height: CGFloat = 48
    var paddingLeft: CGFloat = 16
    var paddingRight: CGFloat = 16
    var paddingTop: CGFloat = 14
    var paddingBottom: CGFloat = 14
    var descriptionHeight: CGFloat = 0
    var separatorHeight: CGFloat = 0
    var titleHeight: CGFloat = 11
    var chevronSize: CGFloat? = 16
    var thumbnailSize: CGFloat? = 0
    var separatorThumbnailWidth: CGFloat? = 0
    var paddingTopThumbnail: CGFloat?
    var paddingBottomThumbnail: CGFloat?
    var paddingBottomChevron: CGFloat? = 20
    var paddingTopChevron: CGFloat? = 20
    var separatorChevronWidth: CGFloat? = 12

    init(subTitleIsEmpty: Bool, thumbnail: PunaThumbnail? = nil) {
        if !subTitleIsEmpty {
            height = 68
            paddingBottom = 13
            descriptionHeight = 18
            separatorHeight = 3
        }
        if let thumbnail = thumbnail {
            switch thumbnail.type {
            case .icon:
                thumbnailSize = 20
                separatorThumbnailWidth = 12
                paddingTopThumbnail =  18
            case .imageCircle, .imageSquare:
                height = 68
                thumbnailSize = 40
                separatorThumbnailWidth = 16
                paddingTopThumbnail = subTitleIsEmpty ? 16 : 21
                paddingBottomThumbnail = 14
                paddingTopChevron = subTitleIsEmpty ? 16 : 21
                paddingBottomChevron = 26
            }
        }
    }
}
