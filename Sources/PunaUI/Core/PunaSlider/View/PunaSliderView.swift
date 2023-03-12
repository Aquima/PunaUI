//
//  
//  PunaSliderView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaSlider
 */
protocol PunaSliderView: UIView {
	var delegate: PunaSliderViewDelegate? { get set }
	var config: PunaSliderViewConfig { get set }

	func update(withConfig config: PunaSliderViewConfig)
}
