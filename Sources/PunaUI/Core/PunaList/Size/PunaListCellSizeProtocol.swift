//
//  PunaListCellSizeProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation

protocol PunaListCellSizeProtocol {
    var font: PunaFontStyle { get }
    var fontDescription: PunaFontStyle { get }
    var height: CGFloat { get }
    var paddingLeft: CGFloat { get }
    var paddingRight: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var descriptionHeight: CGFloat { get }
    var separatorHeight: CGFloat { get }
    var titleHeight: CGFloat { get }
    var chevronSize: CGFloat? { get }
    var thumbnailSize: CGFloat? { get }
    var separatorThumbnailWidth: CGFloat? { get }
    var paddingTopThumbnail: CGFloat? { get }
    var paddingBottomThumbnail: CGFloat? { get }
    var separatorChevronWidth: CGFloat? { get }
    var paddingTopChevron: CGFloat? { get }
    var paddingBottomChevron: CGFloat? { get }
}
