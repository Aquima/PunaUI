//
//  PunaButtonStyle.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 17/12/2019.
//

import Foundation
import UIKit

internal protocol PunaButtonHierarchyProtocol {

    var idleColor: UIColor { get }
    var pressedColor: UIColor { get }
    var disableColor: UIColor { get }

    var fontColor: UIColor { get }

    var spinnerTintColor: UIColor { get }
}
