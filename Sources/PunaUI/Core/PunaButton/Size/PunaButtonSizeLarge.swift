//
//  PunaButtonLargeSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

internal struct PunaButtonSizeLarge: PunaButtonSizeProtocol {

    public init(buttonIcon: PunaButtonIcon? = nil) {
        self.padding = buttonIcon == nil ? 24 : 16
    }

    public var font: UIFont = PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16)

    public var height: CGFloat = 48

    public var borderRadius: CGFloat = 6

    public var padding: CGFloat

    public var spinnerSize: PunaProgressIndicatorSize = .small

}
