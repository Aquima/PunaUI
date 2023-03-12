//
//  PunaThumbnailHierarchyFactory.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

import Foundation

internal class PunaThumbnailHierarchyFactory {
	static func provide(_ hierarchy: PunaThumbnailHierarchy, forType type: PunaThumbnailTypeProtocol, status: PunaThumbnailState) -> PunaThumbnailHierarchyProtocol {

		switch hierarchy {
		case .defaultHierarchy:
			return PunaThumbnailHierarchyDefault(type: type, status: status)
		case .quiet:
			return PunaThumbnailHierarchyQuiet(type: type, status: status)
		case .loud:
			return PunaThumbnailHierarchyLoud(type: type, status: status)
		}
	}
}
