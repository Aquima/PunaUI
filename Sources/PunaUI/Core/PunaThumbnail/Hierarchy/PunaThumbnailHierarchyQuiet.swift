//
//  PunaThumbnailHierarchyQuiet.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 30/06/2020.
//

import Foundation
import UIKit

struct PunaThumbnailHierarchyQuiet: PunaThumbnailHierarchyProtocol {
	var backgroundColor: UIColor
	var iconColor: UIColor?
	var borderColor: UIColor?
	var overlayColor: UIColor?

	init(type: PunaThumbnailTypeProtocol, status: PunaThumbnailState) {

		guard let accentColor = type.accentColor else {
			fatalError("PunaThumbnail - AccentColor must be provider for Quiet Hierarchy")
		}

		if status == .enabled {
			self.backgroundColor = accentColor.withAlphaComponent(0.10)
			self.iconColor = accentColor
		} else {
			self.backgroundColor = UIColor.Puna.gray100
			self.iconColor = UIColor.Puna.gray250
		}
	}
}
