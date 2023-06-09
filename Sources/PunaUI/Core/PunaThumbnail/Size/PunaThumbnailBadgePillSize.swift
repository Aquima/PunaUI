//
//  PunaThumbnailBadgePillSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaThumbnailBadgePillSize: Int, PunaEnumStringConvertible {
	var thumbnailSizeValue: PunaThumbnailSize {
		switch self {
		case .size40: return .size40
		case .size48: return .size48
		case .size56: return .size56
		case .size64: return .size64
		case .size72: return .size72
		case .size80: return .size80
		}
	}

	case size40
	case size48
	case size56
	case size64
	case size72
	case size80

	public static func keyFor(_ value: PunaThumbnailBadgePillSize) -> String {
		switch value {
		case .size40: return "size_40"
		case .size48: return "size_48"
		case .size56: return "size_56"
		case .size64: return "size_64"
		case .size72: return "size_72"
		case .size80: return "size_80"
		}
	}
}
