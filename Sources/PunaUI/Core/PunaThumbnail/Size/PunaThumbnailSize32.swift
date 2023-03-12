//
//  PunaThumbnailSize32.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

internal struct PunaThumbnailSize32: PunaThumbnailSizeProtocol {

	var size: CGFloat
	var cornerRadius: CGFloat
	var borderWidth: CGFloat = 1.0
	var iconSize: CGFloat
	var outlineWidth: CGFloat = 2.0

	init(type: PunaThumbnailTypeProtocol) {
		size = 32
		cornerRadius = type.circular ? size/2 : 3.0
		iconSize = 20
	}
}
