//
//  UITextView+Additions.swift
//  PunaUI
//
//  Created by Marcelo Agustin Gil on 26/07/2020.
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
