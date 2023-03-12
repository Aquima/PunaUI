//
//  PunaThumbnailTypeImageSquare.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 30/06/2020.
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
