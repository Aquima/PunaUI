//
//  PunaSnackbarButtonSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal struct PunaSnackbarButtonSize: PunaButtonSizeProtocol {
    public var font: UIFont = PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 14)

    public var height: CGFloat = 32

    public var borderRadius: CGFloat = 5

    public var padding: CGFloat = 8

    var spinnerSize: PunaProgressIndicatorSize = .medium
}
