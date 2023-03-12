//
//  PunaThumbnailState.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 24/06/2020.
//

/**
The PunaThumbnailState contains the differents states that a thumbnail supports
*/
@objc public enum PunaThumbnailState: Int, PunaEnumStringConvertible {

	case enabled
	case disabled

	public static func keyFor(_ value: PunaThumbnailState) -> String {
		switch value {
		case .enabled: return "ENABLED"
		case .disabled: return "DISABLED"
		}
	}
}
