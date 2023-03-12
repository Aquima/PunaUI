//
//  PunaThumbnailHierarchyFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
