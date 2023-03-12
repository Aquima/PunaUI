//
//  UITextView+Additions.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit
@objc public extension UITextView {
    func setPunaStyle(style: PunaFontStyle) {
        self.font = style.font
        self.textContainerInset = .zero
        self.textContainer.lineFragmentPadding = 0
        self.isScrollEnabled = false
    }
}
