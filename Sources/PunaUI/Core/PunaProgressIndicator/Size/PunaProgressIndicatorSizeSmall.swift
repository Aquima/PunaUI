//
//  PunaProgressIndicatorSizeSmall.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal struct PunaProgressIndicatorSizeSmall: PunaProgressIndicatorSizeProtocol {
    var textSpacing: CGFloat = 16
    var strokeWidth: CGFloat = 2.5
    var height: CGFloat = 24
    var horizontalDistribution: Bool = false
    var textFont: UIFont = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14)

}
