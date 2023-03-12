//
//  PunaThumbnailSizeFactory.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 25/06/2020.
//

import Foundation

/**
The responsability of the factory is to provide the right size by providing the PunaButtonSize
*/
class PunaThumbnailSizeFactory {
	static func provide(_ size: PunaThumbnailSize, type: PunaThumbnailTypeProtocol) -> PunaThumbnailSizeProtocol {
		switch size {
		case .size24:
			return PunaThumbnailSize24(type: type)
		case .size32:
			return PunaThumbnailSize32(type: type)
		case .size40:
			return PunaThumbnailSize40(type: type)
		case .size48:
			return PunaThumbnailSize48(type: type)
		case .size56:
			return PunaThumbnailSize56(type: type)
		case .size64:
			return PunaThumbnailSize64(type: type)
		case .size72:
			return PunaThumbnailSize72(type: type)
		case .size80:
			return PunaThumbnailSize80(type: type)
		}
	}
}
