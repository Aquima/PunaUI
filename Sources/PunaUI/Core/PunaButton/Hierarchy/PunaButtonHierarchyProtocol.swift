//
//  PunaButtonStyle.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
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
