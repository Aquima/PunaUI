//
//  PunaProgressIndicatorSizeSmall.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-20.
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
