//
//  PunaTimePickerCell.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

class PunaTimePickerCell: PunaListCell {
    /**
     This method initialize an PunaTimePickerCell to draw the row just objc
     - Parameters:
       - title: Set the title for the cell
       - subtitle: Set the subtitle for the cell
       - thumbnail: Set a thumbnail to the left of the cell
       - numberOfLines: Set the number of lines to the cell title, the default is 0
     - Authors: @Jona
     - Version : Available since 3.13.0
    */
    @objc public init(withTitle title: String,
                      isSelected: Bool,
                      subtitle: String,
                      thumbnail: PunaThumbnail? = nil,
                      numberOfLines: Int) {
        super.init()
        self.cellConfig(withTitle: title, isSelected: isSelected, subtitle: subtitle, thumbnail: thumbnail, numberOfLines: numberOfLines)
    }

    /**
     This method initialize an PunaTimePickerCell to draw the row
     - Parameters:
       - title: Set the title for the cell
       - subtitle: Set the subtitle for the cell
       - thumbnail: Set a thumbnail to the left of the cell
       - numberOfLines: Set the number of lines to the cell title, the default is 0
     - Authors: @Jona
     - Version : Available since 3.13.0
    */
    public init(withTitle title: String,
                isSelected: Bool,
                subtitle: String? = String(),
                thumbnail: PunaThumbnail? = nil,
                numberOfLines: Int = 0) {
        super.init()
        self.cellConfig(withTitle: title, isSelected: isSelected, subtitle: subtitle, thumbnail: thumbnail, numberOfLines: numberOfLines)
    }

    private func cellConfig(withTitle title: String,
                            isSelected: Bool,
                            subtitle: String?,
                            thumbnail: PunaThumbnail? = nil,
                            numberOfLines: Int) {
        self.type = .timePicker
        self.title = title
        self.subtitle = subtitle ?? ""
        self.numberOfLines = numberOfLines
        self.thumbnail = thumbnail
        self.isSelected = isSelected
    }

    override func updateSize(size: PunaListSize) {
        let config = PunaListCellFactory.provide(withSize: size,
                                                      subTitleIsEmpty: subtitle.isEmpty,
                                                      thumbnail: thumbnail)

        self.fontStyle = config.font
        self.fontSubTitleStyle = config.fontDescription
        self.paddingLeftCell = config.paddingLeft
        self.paddingRightCell = config.paddingRight
        self.paddingTopCell = config.paddingTop
        self.paddingBottomCell = config.paddingBottom
        self.subTitleHeight = config.descriptionHeight
        self.separatorHeight = config.separatorHeight
        self.heightConstraint = config.height
        self.titleHeight = config.titleHeight
        self.chevron = config.chevronImage
        self.chevronSize = config.chevronSize
        self.thumbnailLeft = config.thumbnailLeft
        self.thumbnailSize = config.thumbnailSize
        self.separatorThumbnailWidth = config.separatorThumbnailWidth
        self.paddingTopThumbnail = config.paddingTopThumbnail
        self.paddingBottomThumbnail = config.paddingBottomThumbnail
        self.paddingTopChevron = config.paddingTopChevron
        self.paddingBottomChevron = config.paddingBottomChevron
        self.separatorChevronWidth = config.separatorChevronWidth

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
