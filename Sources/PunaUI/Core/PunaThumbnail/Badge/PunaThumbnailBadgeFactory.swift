//
//  PunaThumbnailBadgeFactory.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 23/08/21.
//

import Foundation
import UIKit

class PunaThumbnailBadgeFactory {

	static func provide(for thumbnail: PunaThumbnailBadge) -> UIView {
		switch (thumbnail.badgeType, thumbnail.size) {
		case (_, .size24), (_, .size32):
			return PunaBadgeDot(type: thumbnail.badgeColor.PunaBadgeType())
		case (.icon, .size40), (.icon, .size48), (.icon, .size56):
			return PunaBadgeIcon(iconType: thumbnail.badgeColor,
								  size: .small)
		case (.icon, .size64), (.icon, .size72), (.icon, .size80):
			return PunaBadgeIcon(iconType: thumbnail.badgeColor,
								  size: .large)
		case (.pill, .size40), (.pill, .size48), (.pill, .size56):
			return PunaBadgePill(hierarchy: .loud,
								  type: thumbnail.badgeColor.PunaBadgeType(),
								  border: .standard,
								  size: .small,
								  text: thumbnail.badgeText)
		case (.pill, .size64), (.pill, .size72), (.pill, .size80):
			return PunaBadgePill(hierarchy: .loud,
								  type: thumbnail.badgeColor.PunaBadgeType(),
								  border: .standard,
								  size: .large,
								  text: thumbnail.badgeText)
		case (.hidden, _):
            let hiddenBadge = PunaBadgePill()
			hiddenBadge.isHidden = true
			return hiddenBadge
		default:
			return PunaBadgeIcon(iconType: thumbnail.badgeColor,
								  size: .small)
		}
	}
}
