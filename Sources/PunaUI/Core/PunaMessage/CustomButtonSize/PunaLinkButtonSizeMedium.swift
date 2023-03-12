//
//  PunaLinkButtonSizeMedium.swift
//  PunaUI
//
//  Created by Alexis Garcia on 13/07/2020.
//

import Foundation
import UIKit

internal struct PunaLinkButtonSizeMedium: PunaButtonSizeProtocol {

    public var font: UIFont = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14)

    public var height: CGFloat = 18

    public var borderRadius: CGFloat = 5

    public var padding: CGFloat = 0

    var spinnerSize: PunaProgressIndicatorSize = .medium

}
