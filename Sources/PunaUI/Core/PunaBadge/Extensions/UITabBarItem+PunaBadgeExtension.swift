//
//  UITabBarItem+PunaBadgeExtension.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import UIKit

@objc public extension UITabBarItem {
    func setPunaBadge(with value: Int) {
        guard value > 0 else {
            removePunaBadge()
            return
        }

        let stringValue: String = value > 99 ? "99+" : String(value)
        removePunaBadge()
        badgeValue = stringValue
        updateBadge(value: stringValue)
    }

    func removePunaBadge() {
        guard let badgeView = getBadgeView() else { return }

        badgeValue = ""
        badgeView.subviews.forEach { $0.removeFromSuperview() }
    }

    private func getBadgeView() -> UIView? {
        guard let parentView = self.value(forKey: "view") as? UIView else { return nil }

        for subview in parentView.subviews {
            if NSStringFromClass(subview.classForCoder) == "_UIBadgeView" {
                return subview
            }
        }
        return nil
    }

    private func updateBadge(value: String) {
        guard let view = getBadgeView() else {
            removePunaBadge()
            return
        }

        badgeColor = .clear
        view.backgroundColor = .clear

        let pillView = PunaBadgePill(hierarchy: .loud, type: .error, border: .standard, size: .small, text: value)
        view.addSubview(pillView)
        pillView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1).isActive = true
        pillView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -4).isActive = true
    }
}
