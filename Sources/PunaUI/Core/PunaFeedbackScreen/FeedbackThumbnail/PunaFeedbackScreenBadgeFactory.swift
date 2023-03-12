//
//  PunaFeedbackScreenBadgeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/15/20.
//

import Foundation
import UIKit

class PunaFeedbackScreenBadgeFactory {
    static func createThumbnailBadgeView(thumbnailInfo: PunaFeedbackScreenThumbnail?) -> PunaThumbnailBadge {
        guard let thumbnailInfo = thumbnailInfo,
              let feedbackColor = thumbnailInfo.color else {
            return PunaThumbnailBadge()
        }
        switch thumbnailInfo.thumbnailType {
        case .image:
            let thumbnailBadge = PunaThumbnailBadge(thumbnailType: .imageCircle,
                                                     image: thumbnailInfo.image ?? UIImage(),
                                                     color: feedbackColor.colorType)
            thumbnailBadge.setupBadgeIconPill(color: feedbackColor.colorType,
                                              thumbnailSize: .size64)
            return thumbnailBadge
        case .icon:
            let thumbnailBadge = PunaThumbnailBadge(thumbnailType: .icon,
                                                     image: thumbnailInfo.image ?? UIImage(),
                                                     color: feedbackColor.colorType)
            thumbnailBadge.thumbnailType = .icon
            thumbnailBadge.setupBadgeIconPill(color: feedbackColor.colorType,
                                              thumbnailSize: .size64)
            return thumbnailBadge
        case .iconWithoutBadge:
            let iconImageView = UIImageView()
            PunaIconsProvider.loadIcon(name: feedbackColor.iconName, placeItInto: iconImageView)
            let thumbnailBadge = PunaThumbnailBadge(thumbnailType: .icon,
                                                     image: iconImageView.image ?? UIImage(),
                                                     color: feedbackColor.colorType,
                                                     size: .size64)
            return thumbnailBadge
        }
    }
}
