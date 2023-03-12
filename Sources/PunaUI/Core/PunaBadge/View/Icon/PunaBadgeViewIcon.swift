//
//  PunaBadgeViewIcon.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import UIKit

class PunaBadgeViewIcon: PunaBadgeAbstractView {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaBadgeViewIcon", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()

        PunaIconsProvider.loadIcon(name: config.icon ?? "", success: { image in
            iconView.image = image.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = UIColor.white
        })

        heightConstraint.constant = config.height ?? 0
        self.backgroundColor = UIColor.clear

        iconView.backgroundColor = config.backgroundColor
        let cornerRadius = config.cornerRadius
        let roundedCorners = config.roundedCorners
        iconView.setCornerRadius(cornerRadius: cornerRadius, roundedCorners: roundedCorners)
    }
}
