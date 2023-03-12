//
//  PunaSliderViewDelegate.swift
//  PunaUI
//
//  Created by Victor Chang on 19/04/2021.
//

import Foundation
import UIKit

internal protocol PunaSliderViewDelegate: AnyObject {
    func onValueChanged(value: Double, sender: UISlider)
}
