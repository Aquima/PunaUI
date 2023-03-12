//
//  PunaMessageTypeProtocol.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/15/20.
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
