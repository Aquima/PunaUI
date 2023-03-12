//
//  PunaFeedbackScreenThumbnailType.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/15/20.
//

import Foundation

enum PunaFeedbackScreenThumbnailType: Int, PunaEnumStringConvertible {

    case image
    case icon
    case iconWithoutBadge

    static func keyFor(_ value: PunaFeedbackScreenThumbnailType) -> String {
        switch value {
        case .image:
            return "IMAGE"
        case .icon:
            return "ICON"
        case .iconWithoutBadge:
            return "ICON_WITHOUT_BADGE"
        }
    }
}
