//
//  CALayer+Additions.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

extension CALayer {
    func roundContentView(with radius: CGFloat, isMaskToBounds: Bool) {
        self.cornerRadius = radius
        self.masksToBounds = isMaskToBounds
    }

    func applyShadow(with shadowRadius: CGFloat, shadowOpacity: Float, isMaskToBounds: Bool, shadowOffSet: CGSize? = CGSize(width: 5.0, height: 5.0), shadowColor: CGColor? = UIColor.black.cgColor, shadowPath: CGPath? = nil) {
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.masksToBounds = isMaskToBounds
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffSet!
        self.shadowPath = shadowPath
    }

}
