//
//  PunaThumbnailTypeImageCircle.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaThumbnailTypeImageCircle: PunaThumbnailTypeProtocol {

	var accentColor: UIColor?
	var borderColor: UIColor?
	var circular: Bool = true

	init() {
		borderColor = UIColor.Puna.gray070
	}
}
