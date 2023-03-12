//
//  PunaTagSizeSmall.swift
//  PunaUI
//
//  Created by Samuel Sainz on 5/29/20.
//

import Foundation
import UIKit

struct PunaTagSizeSmall: PunaTagSizeProtocol {
    var font: UIFont = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 12)

    var height: CGFloat = 24

    var horizontalPadding: CGFloat = 8

    var cornerRadius: CGFloat = 12

    var shouldShowLeftContent: Bool = false

    var rightButtonWidth: CGFloat = 24
}
