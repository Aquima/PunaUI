//
//  PunaThumbnailHierarchy.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

/**
The PunaThumbnailHierarchy contains the differents hierarchies that a thumbnail supports
*/
@objc public enum PunaThumbnailHierarchy: Int, PunaEnumStringConvertible {
	case defaultHierarchy
	case loud
	case quiet

	public static func keyFor(_ value: PunaThumbnailHierarchy) -> String {
		switch value {
		case .loud: return "LOUD"
		case .quiet: return "QUIET"
		case .defaultHierarchy: return "DEFAULT"
		}
	}
}
