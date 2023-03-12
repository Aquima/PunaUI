//
//  PunaThumbnailHierarchyDefault.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

import Foundation
import UIKit

struct PunaThumbnailHierarchyDefault: PunaThumbnailHierarchyProtocol {
	var backgroundColor: UIColor
	var iconColor: UIColor?
	var borderColor: UIColor?
	var overlayColor: UIColor?

	init(type: PunaThumbnailTypeProtocol, status: PunaThumbnailState) {

		self.backgroundColor = .white
		self.borderColor = type.borderColor

		if status == .enabled {
			self.iconColor = UIColor.Puna.gray900
		} else {
			self.overlayColor =  UIColor.white.withAlphaComponent(0.6)
			self.iconColor = UIColor.Puna.gray250
		}
	}
}
