//
//  PunaMessageTypeSuccess.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaMessageTypeSuccess: PunaMessageTypeProtocol {
    var primaryColor: UIColor = UIColor.Puna.green500
    var secondaryColor: UIColor = UIColor.Puna.green600
    var primaryButtonPressedColor: UIColor = UIColor.Puna.green800
    var secondaryButtonPressedColor: UIColor = UIColor.Puna.green700
    var linkButtonPressedColor: UIColor = .clear
    var icon: String = PunaIcons.feedbackSuccess16
}
