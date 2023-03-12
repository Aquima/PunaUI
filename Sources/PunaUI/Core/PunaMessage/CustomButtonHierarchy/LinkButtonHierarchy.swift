//
//  LinkButtonHierarchy.swift
//  PunaUI
//
//  Created by Alexis Garcia on 29/06/2020.
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
