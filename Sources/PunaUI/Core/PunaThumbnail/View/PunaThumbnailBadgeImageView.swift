//
//  PunaThumbnailBadgeImageView.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 19/08/21.
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
