//
//  PunaThumbnailSize72.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//
import Foundation

internal struct PunaThumbnailSize72: PunaThumbnailSizeProtocol {

	var size: CGFloat
	var cornerRadius: CGFloat
	var borderWidth: CGFloat = 1.0
	var iconSize: CGFloat
	var outlineWidth: CGFloat = 3.0

	init(type: PunaThumbnailTypeProtocol) {
		size = 72
		cornerRadius = type.circular ? size/2 : 5.0
		iconSize = 32
	}
}
