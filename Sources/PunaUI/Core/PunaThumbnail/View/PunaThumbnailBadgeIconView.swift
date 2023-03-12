//
//  PunaThumbnailBadgeIconView.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 23/08/21.
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
