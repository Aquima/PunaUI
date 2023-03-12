//
//  PunaMessageTypeProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal protocol PunaMessageTypeProtocol {
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var primaryButtonPressedColor: UIColor { get }
    var secondaryButtonPressedColor: UIColor { get }
    var linkButtonPressedColor: UIColor { get }
    var icon: String { get }
}
