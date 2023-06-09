//
//  PunaThumbnailSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//
import Foundation
import CoreFoundation
/**
The PunaThumbnailSize contains the differents sizes that a Thumbnail supports
*/
@objc public enum PunaThumbnailSize: Int, PunaEnumStringConvertible {

	case size24
	case size32
	case size40
	case size48
	case size56
	case size64
	case size72
	case size80

	public static func keyFor(_ value: PunaThumbnailSize) -> String {
		switch value {
		case .size24: return "size_24"
		case .size32: return "size_32"
		case .size40: return "size_40"
		case .size48: return "size_48"
		case .size56: return "size_56"
		case .size64: return "size_64"
		case .size72: return "size_72"
		case .size80: return "size_80"
		}
	}

	public static func floatToPunaThumbnailSize(value: CGFloat) -> PunaThumbnailSize {
		return self.allCases.first { $0.toString().stringToFloat() == value } ?? .size40
	}
}
