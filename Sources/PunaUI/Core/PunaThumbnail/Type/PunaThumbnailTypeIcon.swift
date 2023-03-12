//
//  PunaThumbnailTypeIcon.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaThumbnailTypeIcon: PunaThumbnailTypeProtocol {

	var accentColor: UIColor?
	var borderColor: UIColor?
	var circular: Bool = true

	init(accentColor: UIColor?) {
		self.accentColor = accentColor
		self.borderColor = UIColor.Puna.gray070
	}
}
