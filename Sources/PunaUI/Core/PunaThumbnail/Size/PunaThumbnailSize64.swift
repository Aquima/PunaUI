//
//  PunaThumbnailSize64.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 25/06/2020.
//
import Foundation

internal struct PunaThumbnailSize64: PunaThumbnailSizeProtocol {

	var size: CGFloat
	var cornerRadius: CGFloat
	var borderWidth: CGFloat = 1.0
	var iconSize: CGFloat
	var outlineWidth: CGFloat = 3.0

	init(type: PunaThumbnailTypeProtocol) {
		size = 64
		cornerRadius = type.circular ? size/2 : 4.0
		iconSize = 32
	}
}
