//
//  PunaSliderStateIdle.swift
//  PunaUI
//
//  Created by Victor Chang on 27/02/2021.
//

import Foundation
import UIKit

internal struct PunaSliderStateIdle: PunaSliderStateProtocol {
    var isEnabled = true
    var sliderColor: UIColor = UIColor.Puna.gray100
    var thumbBackgroundColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
    var thumbColor: UIColor = UIColor.Puna.white
}
