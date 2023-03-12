//
//  PunaProgressIndicatorSizeLarge.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-20.
//

import Foundation
import UIKit

internal struct PunaProgressIndicatorSizeLarge: PunaProgressIndicatorSizeProtocol {

    var strokeWidth: CGFloat = 4
    var height: CGFloat = 48
    var textSpacing: CGFloat = 20
    var horizontalDistribution: Bool = false
    var textFont: UIFont = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 16)

}
