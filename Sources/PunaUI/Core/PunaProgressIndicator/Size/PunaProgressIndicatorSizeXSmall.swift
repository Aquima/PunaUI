//
//  PunaProgressIndicatorSizeXSmall.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 10-12-20.
//

import Foundation
import UIKit

internal struct PunaProgressIndicatorSizeXSmall: PunaProgressIndicatorSizeProtocol {
    var textSpacing: CGFloat = 12
    var strokeWidth: CGFloat = 2
    var height: CGFloat = 16
    var horizontalDistribution: Bool = true

    var textFont: UIFont = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14)

}
