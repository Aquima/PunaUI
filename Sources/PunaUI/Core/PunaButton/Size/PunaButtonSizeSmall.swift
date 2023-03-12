//
//  PunaButtonSmallSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

internal struct PunaButtonSizeSmall: PunaButtonSizeProtocol {

    public var font: UIFont = PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 12)

    public var height: CGFloat = 24

    public var borderRadius: CGFloat = 4

    public var padding: CGFloat = 8

    public var spinnerSize: PunaProgressIndicatorSize = .xSmall

}
