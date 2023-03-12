//
//  LinkButtonHierarchy.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

struct LinkMessageActionButtonHierarchy: PunaButtonHierarchyProtocol {

    public var idleColor: UIColor = .clear

    public var pressedColor: UIColor

    public var focusColor: UIColor = .clear

    public var disableColor: UIColor = .clear

    public var fontColor: UIColor

    var spinnerTintColor: UIColor = .clear

    init(textColor: UIColor, pressedColor: UIColor) {
        self.fontColor = textColor
        self.pressedColor = pressedColor
    }
}
