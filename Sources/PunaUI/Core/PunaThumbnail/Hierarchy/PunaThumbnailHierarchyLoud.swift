//
//  PunaThumbnailHierarchyLoud.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaThumbnailHierarchyLoud: PunaThumbnailHierarchyProtocol {
	var backgroundColor: UIColor
	var iconColor: UIColor?
	var borderColor: UIColor?
	var overlayColor: UIColor?

	init(type: PunaThumbnailTypeProtocol, status: PunaThumbnailState) {

		guard let accentColor = type.accentColor else {
			fatalError("PunaThumbnail - AccentColor must be provider for Loud Hierarchy")
		}

		if status == .enabled {
			self.backgroundColor = accentColor
			self.iconColor = UIColor.white
		} else {
			self.backgroundColor = UIColor.Puna.gray100
			self.iconColor = UIColor.Puna.gray250
		}
	}
}
