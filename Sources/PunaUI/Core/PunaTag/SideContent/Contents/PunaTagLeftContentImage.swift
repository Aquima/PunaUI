//
//  PunaTagLeftContentImage.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public class PunaTagLeftContentImage: NSObject, PunaTagLeftContent {
    var avatar: UIImage

    @objc public init(avatar: UIImage) {
        self.avatar = avatar
        super.init()
    }
}
