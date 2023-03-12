//
//  PunaThumbnailType.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

/**
The PunaThumbnailType contains the differents types that a thumbnail supports
*/
@objc public enum PunaThumbnailType: Int, PunaEnumStringConvertible {

	case icon
	case imageCircle
	case imageSquare

	public static func keyFor(_ value: PunaThumbnailType) -> String {
		switch value {
		case .icon: return "ICON"
		case .imageCircle: return "IMAGE_CIRCLE"
		case .imageSquare: return "IMAGE_SQUARE"
		}
	}
}
