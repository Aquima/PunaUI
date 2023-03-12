//
//  PunaThumbnailBadgeImageView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//
import UIKit

class PunaThumbnailBadgeImageView: PunaThumbnailImageView, PunaThumbnailBadgeableView {
    var badgeView: UIView!

    override func drawImage() {
        super.drawImage()
        setupOutline()
        setupBadge()
    }
}
