//
//  PunaSliderStateIdle.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal struct PunaSliderStateIdle: PunaSliderStateProtocol {
    var isEnabled = true
    var sliderColor: UIColor = UIColor.Puna.gray100
    var thumbBackgroundColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
    var thumbColor: UIColor = UIColor.Puna.white
}
