//
//  PunaThumbnailViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/**
The responsability of the factory is to provide the ViewConfig from the user specified attributes
*/
internal class PunaThumbnailViewConfigFactory {

	static func provide(for thumbnail: PunaThumbnail) -> PunaThumbnailViewConfig {

		let thumbnailType = PunaThumbnailTypeFactory.provide(thumbnail.type, accentColor: thumbnail.accentColor, borderColor: nil)

		let thumbnailHierarchy = PunaThumbnailHierarchyFactory.provide(thumbnail.hierarchy, forType: thumbnailType, status: thumbnail.state)
		let thumbnailSize = PunaThumbnailSizeFactory.provide(thumbnail.size, type: thumbnailType)

		return PunaThumbnailViewConfig(image: thumbnail.image, size: thumbnailSize.size, iconSize: thumbnailSize.iconSize, cornerRadius: thumbnailSize.cornerRadius, borderColor: thumbnailHierarchy.borderColor, overlayColor: thumbnailHierarchy.overlayColor, backgroundColor: thumbnailHierarchy.backgroundColor, iconColor: thumbnailHierarchy.iconColor)
	}

	static func provide(for thumbnailBadge: PunaThumbnailBadge) -> PunaThumbnailViewConfig {

		let outlineColor = PunaBadgeTypeFactory.provide(thumbnailBadge.badgeColor.PunaBadgeType()).primaryColor
		let thumbnailType = PunaThumbnailTypeFactory.provide(thumbnailBadge.thumbnailType.thumbnailType(),
															  accentColor: outlineColor,
															  borderColor: nil)
		let thumbnailSize = PunaThumbnailSizeFactory.provide(thumbnailBadge.size, type: thumbnailType)

		let thumbnailBadgeView = PunaThumbnailBadgeFactory.provide(for: thumbnailBadge)

		return PunaThumbnailViewConfig(image: thumbnailBadge.image,
										size: thumbnailSize.size,
										iconSize: thumbnailSize.iconSize,
										cornerRadius: thumbnailSize.cornerRadius,
										borderColor: nil,
										overlayColor: nil,
										backgroundColor: PunaStyleSheetManager.styleSheet.bgColorWhite,
										iconColor: outlineColor,
										outlineColor: outlineColor,
										outlineWidth: thumbnailSize.outlineWidth,
										badgeView: thumbnailBadgeView)
	}
}
