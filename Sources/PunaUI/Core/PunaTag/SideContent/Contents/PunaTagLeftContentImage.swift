//
//  PunaTagLeftContentImage.swift
//  PunaUI
//
//  Created by Samuel Sainz on 6/4/20.
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
