//
//  PunaThumbnailTypeImageSquare.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaThumbnailTypeImageSquare: PunaThumbnailTypeProtocol {

	var accentColor: UIColor?
	var borderColor: UIColor?
	var circular: Bool = false

	init() {
		borderColor = UIColor.Puna.gray070
	}
}
