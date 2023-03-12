//
//  PunaProgressIndicatorSizeMedium.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal struct PunaProgressIndicatorSizeMedium: PunaProgressIndicatorSizeProtocol {
    var textSpacing: CGFloat = 16
    var strokeWidth: CGFloat = 3
    var height: CGFloat = 32
    var horizontalDistribution: Bool = false
    var textFont: UIFont = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14)

}
