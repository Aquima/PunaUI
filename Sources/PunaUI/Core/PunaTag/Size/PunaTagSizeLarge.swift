//
//  PunaTagSizeLarge.swift
//  PunaUI
//
//  Created by Samuel Sainz on 5/29/20.
//

import UIKit

struct PunaTagSizeLarge: PunaTagSizeProtocol {
    var font: UIFont = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14)

    var height: CGFloat = 32

    var horizontalPadding: CGFloat = 12

    var cornerRadius: CGFloat = 16

    var shouldShowLeftContent: Bool = true

    var rightButtonWidth: CGFloat = 32
}
