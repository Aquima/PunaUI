//
//  PunaSliderStateProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal protocol PunaSliderStateProtocol {

	var isEnabled: Bool { get }
	var sliderColor: UIColor { get }
	var thumbBackgroundColor: UIColor { get }
	var thumbColor: UIColor { get }
}
