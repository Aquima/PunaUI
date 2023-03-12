//
//  PunaButtonQuiet.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 17/12/2019.
//

import Foundation
import UIKit

internal struct PunaButtonHierarchyQuiet: PunaButtonHierarchyProtocol {

    public var idleColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor150

    public var pressedColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor300

    public var focusColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor200

    public var disableColor: UIColor = UIColor.Puna.gray100

    public var fontColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor

    var spinnerTintColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
}
