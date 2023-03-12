//
//  PunaTextFieldComponentIcon.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public class PunaTextFieldComponentIcon: NSObject, PunaTextFieldRightComponent, PunaTextFieldLeftComponent {
    public private(set) var visibility: PunaTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: PunaTextFieldComponentReloadPolicy = .always

    @objc public private(set) var icon: UIImage = UIImage()
    @objc public private(set) var tintColor: UIColor = .clear

    @objc public convenience init(PunaIconName: String, tintColor: UIColor) {
        self.init()
        PunaIconsProvider.loadIcon(name: PunaIconName, success: { self.icon = $0 })
        self.tintColor = tintColor
    }

    @objc public convenience init(icon: UIImage, tintColor: UIColor) {
        self.init()
        self.icon = icon
        self.tintColor = tintColor
    }
}
