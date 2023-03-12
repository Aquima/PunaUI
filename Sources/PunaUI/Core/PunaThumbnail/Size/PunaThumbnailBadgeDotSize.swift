//
//  PunaThumbnailBadgeDotSize.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 24/08/21.
//

import Foundation

@objc public enum PunaThumbnailBadgeDotSize: Int, PunaEnumStringConvertible {
	var thumbnailSizeValue: PunaThumbnailSize {
		switch self {
		case .size24: return .size24
		case .size32: return .size32
		}
	}

	case size24
	case size32

	public static func keyFor(_ value: PunaThumbnailBadgeDotSize) -> String {
		switch value {
		case .size24: return "size_24"
		case .size32: return "size_32"
		}
	}
}
