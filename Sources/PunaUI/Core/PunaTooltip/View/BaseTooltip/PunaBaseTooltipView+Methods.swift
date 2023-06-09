//
//  PunaBaseTooltipView+Methods.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

extension PunaBaseTooltipView {

    func show(target targetView: UIView, withinSuperview superview: UIView, position: PunaTooltipPosition, sizeStyle: PunaTooltipWidthSize = .dynamic) {

        self.bubblePosition = adjustTooltipPosition(with: position, sizeStyle: sizeStyle)
        presentingView = targetView
        arrange(withinSuperview: superview, sizeStyle: sizeStyle)
        superview.addSubview(self)
        self.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)

        transform = CGAffineTransform(translationX: 0, y: animationTransform)
        alpha = 0

        UIView.animate(withDuration: self.animationDuration, delay: 0, options: [.curveEaseInOut], animations: { [weak self] in
            self?.alpha = 1
            self?.transform = .identity
        })
    }

    func dismiss() {
        UIView.animate(withDuration: self.animationDuration, delay: 0, options: [.curveEaseInOut], animations: { [weak self] in
            self?.frame.origin.y += self?.animationTransform ?? 0
            self?.alpha = 0
        }) { [weak self] _ in
            self?.delegate?.onDismissed()
            self?.removeFromSuperview()
        }
    }

    private func adjustTooltipPosition(with position: PunaTooltipPosition, sizeStyle: PunaTooltipWidthSize) -> PunaTooltipPosition {
        if sizeStyle == .fullSize && (position == .left || position == .right) {
            return .top
        }
        return position
    }
}
