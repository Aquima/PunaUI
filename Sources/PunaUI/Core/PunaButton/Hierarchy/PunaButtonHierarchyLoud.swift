//
//  PunaButtonLoud.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 17/12/2019.
//

import Foundation
import UIKit

/**
The PunaButtonSizeProtocol provides the differents attributes that define the style of the button, these can be constants or calculated
*/
internal struct PunaButtonHierarchyLoud: PunaButtonHierarchyProtocol {

    public var idleColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor

    public var pressedColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor700

    public var focusColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor

    public var disableColor: UIColor = UIColor.Puna.gray100

    public var fontColor: UIColor = PunaStyleSheetManager.styleSheet.textColorWhite

    var spinnerTintColor: UIColor = PunaStyleSheetManager.styleSheet.textColorWhite

}
