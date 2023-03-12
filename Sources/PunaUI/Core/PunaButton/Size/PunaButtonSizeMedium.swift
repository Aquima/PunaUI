//
//  PunaButtonMediumSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

internal struct PunaButtonSizeMedium: PunaButtonSizeProtocol {

    public var font: UIFont = PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 14)

    public var height: CGFloat = 32

    public var borderRadius: CGFloat = 5

    public var padding: CGFloat = 12

    var spinnerSize: PunaProgressIndicatorSize = .xSmall

}
