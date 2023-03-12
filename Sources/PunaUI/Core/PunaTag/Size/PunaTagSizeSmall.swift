//
//  PunaTagSizeSmall.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
