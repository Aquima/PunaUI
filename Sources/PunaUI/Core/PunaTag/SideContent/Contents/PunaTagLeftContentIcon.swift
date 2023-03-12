//
//  PunaTagLeftContentIcon.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public class PunaTagLeftContentIcon: NSObject, PunaTagLeftContent {
    var backgroundColor: UIColor
    var icon: UIImage = UIImage()
    var iconColor: UIColor = UIColor.clear

    @objc public init(backgroundColor: UIColor, icon: UIImage, iconColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.icon = icon
        self.iconColor = iconColor
        super.init()
    }

    @objc public init(backgroundColor: UIColor, PunaIconName: String, iconColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.iconColor = iconColor
        super.init()
        PunaIconsProvider.loadIcon(name: PunaIconName, success: { self.icon = $0 })
    }
}
