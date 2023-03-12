//
//  PunaSliderViewDelegate.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal protocol PunaSliderViewDelegate: AnyObject {
    func onValueChanged(value: Double, sender: UISlider)
}
