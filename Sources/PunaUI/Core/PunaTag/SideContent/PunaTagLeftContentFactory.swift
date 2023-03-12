//
//  PunaTagLeftComponentFactory.swift
//  PunaUI
//
//  Created by Samuel Sainz on 6/4/20.
//

import Foundation
import UIKit

class PunaTagLeftContentFactory {

    static func generateLeftContentView(for leftContent: PunaTagLeftContent) -> UIView? {
        switch leftContent {
        case let content as PunaTagLeftContentDot:
            return PunaTagLeftContentDotView(backgroundColor: content.backgroundColor, text: content.text, textColor: content.textColor)
        case let content as PunaTagLeftContentIcon:
            return PunaTagLeftContentIconView(backgroundColor: content.backgroundColor, icon: content.icon, iconColor: content.iconColor)
        case let content as PunaTagLeftContentImage:
            return PunaTagLeftContentImageView(image: content.avatar)
        default:
            return nil
        }
    }
}
