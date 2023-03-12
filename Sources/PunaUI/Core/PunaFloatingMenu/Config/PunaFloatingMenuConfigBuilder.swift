//
//  PunaFloatingMenuConfigBuilder.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 22/06/2021.
//

import Foundation
import UIKit

@objc public class PunaFloatingMenuConfigBuilder: NSObject {
    @objc public var fromFrame: CGRect
    @objc public var PunaList: PunaList
    @objc public var parentView: UIView
    @objc public var widthType: PunaFloatingMenuWidthType
    @objc public var showFrom: PunaFloatingOpenTypeHorizontal = .left
    @objc public var rowsDisplayed: PunaFloatingMenuNumberRow = .medium
    @objc public var heigthNavBar: CGFloat
    @objc public var fixedWidth: CGFloat = 150
    @objc public var isForTimePicker: Bool = false

    @objc public init(PunaList: PunaList, parentView: UIView) {
        self.fromFrame = CGRect.zero
        self.PunaList = PunaList
        self.parentView = parentView
        self.widthType = .fixed
        self.heigthNavBar = 96.0
        self.showFrom = .left
        super.init()
    }

    @objc public func buildConfig() -> PunaFloatingMenuConfig {
        return PunaFloatingMenuConfig(fromFrame: fromFrame ,
                                       PunaList: PunaList,
                                       parentView: parentView,
                                       widthType: widthType,
                                       showFrom: showFrom,
                                       rowsDisplayed: rowsDisplayed,
                                       heigthNavBar: heigthNavBar,
                                       fixedWidth: fixedWidth)
    }
}
