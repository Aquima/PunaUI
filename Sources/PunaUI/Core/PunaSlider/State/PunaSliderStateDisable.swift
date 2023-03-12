//
//  PunaSliderStateDisable.swift
//  PunaUI
//
//  Created by Victor Chang on 27/02/2021.
//

import Foundation
import UIKit

internal struct PunaSliderStateDisable: PunaSliderStateProtocol {

    var isEnabled = false
    var sliderColor: UIColor = UIColor.Puna.gray100
    var thumbBackgroundColor: UIColor = UIColor.Puna.gray250
    var thumbColor: UIColor = UIColor.Puna.white
}
