//
//  PunaSliderStateProtocol.swift
//  PunaUI
//
//  Created by Victor Chang on 27/02/2021.
//

import Foundation
import UIKit

internal protocol PunaSliderStateProtocol {

	var isEnabled: Bool { get }
	var sliderColor: UIColor { get }
	var thumbBackgroundColor: UIColor { get }
	var thumbColor: UIColor { get }
}
