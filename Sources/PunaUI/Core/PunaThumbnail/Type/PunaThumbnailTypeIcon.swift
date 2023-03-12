//
//  PunaThumbnailTypeIcon.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 30/06/2020.
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
