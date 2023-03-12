//
//  PunaThumbnailSizeProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/**
The PunaThumbnailSizeProtocol provides the differents attributes that define the size of the Thumbnail, these can be constants or calculated
*/

internal protocol PunaThumbnailSizeProtocol {

	var size: CGFloat { get }
	var cornerRadius: CGFloat { get }
	var borderWidth: CGFloat { get }
	var iconSize: CGFloat { get }
	var outlineWidth: CGFloat { get }
}
