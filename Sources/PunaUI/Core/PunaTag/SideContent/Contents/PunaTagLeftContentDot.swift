//
//  PunaTagLeftContentDot.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public class PunaTagLeftContentDot: NSObject, PunaTagLeftContent {
    var backgroundColor: UIColor
    var text: String?
    var textColor: UIColor?

    @objc public init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        super.init()
    }

    @objc public init(backgroundColor: UIColor, text: String, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.text = text
        self.textColor = textColor
        super.init()
    }
}
