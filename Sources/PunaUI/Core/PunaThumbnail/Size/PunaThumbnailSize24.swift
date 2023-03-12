//
//  PunaThumbnailSize24.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 25/06/2020.
//
import Foundation

internal struct PunaThumbnailSize24: PunaThumbnailSizeProtocol {

	var size: CGFloat
	var cornerRadius: CGFloat
	var borderWidth: CGFloat = 1.0
	var iconSize: CGFloat
	var outlineWidth: CGFloat = 2.0

	init(type: PunaThumbnailTypeProtocol) {
		size = 24
		cornerRadius = type.circular ? size/2 : 3.0
		iconSize = 16
	}
}