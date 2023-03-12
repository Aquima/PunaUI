//
//  PunaMessageTypeWarning.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
import UIKit

class PunaMessageTypeWarning: PunaMessageTypeProtocol {
    var primaryColor: UIColor = UIColor.Puna.orange500
    var secondaryColor: UIColor = UIColor.Puna.orange600
    var primaryButtonPressedColor: UIColor = UIColor.Puna.orange800
    var secondaryButtonPressedColor: UIColor = UIColor.Puna.orange700
    var linkButtonPressedColor: UIColor = .clear
    var icon: String = PunaIcons.feedbackWarning16
}
