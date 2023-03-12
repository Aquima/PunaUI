//
//  PunaMessageTypeError.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
import UIKit

class PunaMessageTypeError: PunaMessageTypeProtocol {
    var primaryColor: UIColor = UIColor.Puna.red500
    var secondaryColor: UIColor = UIColor.Puna.red600
    var primaryButtonPressedColor: UIColor = UIColor.Puna.red800
    var secondaryButtonPressedColor: UIColor = UIColor.Puna.red700
    var linkButtonPressedColor: UIColor = .clear
    var icon: String = PunaIcons.feedbackError16
}
