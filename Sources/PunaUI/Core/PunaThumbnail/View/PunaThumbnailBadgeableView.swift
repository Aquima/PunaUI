//
//  PunaThumbnailBadgeableView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//
import UIKit
protocol PunaThumbnailBadgeableView: UIView {
    var badgeView: UIView! { get set }
    var config: PunaThumbnailViewConfig {get set}
    func setupBadge(at anglePosition: CGFloat)
}

extension PunaThumbnailBadgeableView {
    func setupBadge(at anglePosition: CGFloat = 315) {
        if let badgeView = badgeView {
            badgeView.removeFromSuperview()
        }
        guard let badgeView = config.badgeView,
              superview != nil else {
            return
        }
        self.badgeView = badgeView
        superview?.addSubview(badgeView)

        let (horizontalMultiplier, verticalMultiplier) = computeMultipliers(angle: anglePosition)
        NSLayoutConstraint(item: badgeView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: superview,
                           attribute: .trailing,
                           multiplier: horizontalMultiplier,
                           constant: .zero).isActive = true
        NSLayoutConstraint(item: badgeView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: superview,
                           attribute: .bottom,
                           multiplier: verticalMultiplier,
                           constant: .zero).isActive = true
    }

    func setupOutline() {
        guard let outlineWidth = config.outlineWidth,
              let outlineColor = config.outlineColor?.cgColor else {
            return
        }
        layer.borderWidth = outlineWidth
        layer.borderColor = outlineColor
    }

    private func computeMultipliers(angle: CGFloat) -> (CGFloat, CGFloat) {
        let radians = angle * .pi / 180

        let horizontal = (1.0 + cos(radians)) / 2
        let vertical = (1.0 - sin(radians)) / 2

        return (horizontal, vertical)
    }
}
