//
//  PunaFloatingMenuConfig.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 21/06/2021.
//

import UIKit

@objc public class PunaFloatingMenuConfig: NSObject {
    @objc let fromFrame: CGRect
    @objc let PunaList: PunaList
    @objc let parentView: UIView
    @objc let widthType: PunaFloatingMenuWidthType
    @objc let showFrom: PunaFloatingOpenTypeHorizontal
    @objc let rowsDisplayed: PunaFloatingMenuNumberRow
    @objc let heigthNavBar: CGFloat
    @objc let fixedWidth: CGFloat

    init(fromFrame: CGRect,
         PunaList: PunaList,
         parentView: UIView,
         widthType: PunaFloatingMenuWidthType,
         showFrom: PunaFloatingOpenTypeHorizontal = .left,
         rowsDisplayed: PunaFloatingMenuNumberRow = .medium,
         heigthNavBar: CGFloat,
         fixedWidth: CGFloat = 150) {
        self.fromFrame = fromFrame
        self.PunaList = PunaList
        self.parentView = parentView
        self.widthType = widthType
        self.showFrom = showFrom
        self.rowsDisplayed = rowsDisplayed
        self.heigthNavBar = heigthNavBar
        self.fixedWidth = fixedWidth
    }
}
