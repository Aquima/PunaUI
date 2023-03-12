//
//  PunaPageDotView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

class PunaPageDotView: UIView {
    override func tintColorDidChange() {
        self.backgroundColor = tintColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }

    override var frame: CGRect {
        didSet {
            updateCornerRadius()
        }
    }

    private func updateCornerRadius() {
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }
}
