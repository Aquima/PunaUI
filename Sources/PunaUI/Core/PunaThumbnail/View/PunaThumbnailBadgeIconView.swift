//
//  PunaThumbnailBadgeIconView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//
import UIKit

class PunaThumbnailBadgeIconView: PunaThumbnailIconView, PunaThumbnailBadgeableView {
    var badgeView: UIView!

    override func drawImage() {
        super.drawImage()
        setupOutline()
        setupBadge()
    }
}
