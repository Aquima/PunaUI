//
//  PunaButtonTransparent.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 17/12/2019.
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
