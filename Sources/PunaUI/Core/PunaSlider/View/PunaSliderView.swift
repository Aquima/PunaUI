//
//  
//  PunaSliderView.swift
//  PunaUI
//
//  Created by Victor Chang on 25/02/2021.
//
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
