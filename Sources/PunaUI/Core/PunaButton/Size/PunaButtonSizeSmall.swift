//
//  PunaButtonSmallSize.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 17/12/2019.
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
