//
//  PunaButtonTransparent.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

internal struct PunaButtonHierarchyTransparent: PunaButtonHierarchyProtocol {

    public var idleColor: UIColor = .clear

    public var pressedColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor200

    public var focusColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor100

    public var disableColor: UIColor = .clear

    public var fontColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor

    var spinnerTintColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
}
