//
//  PunaBadgeViewDot.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import Foundation
import UIKit

class PunaBadgeViewDot: PunaBadgeAbstractView {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaBadgeViewDot", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()

        heightConstraint.constant = config.height!

        let cornerRadius = config.cornerRadius
        let roundedCorners = config.roundedCorners
        setCornerRadius(cornerRadius: cornerRadius, roundedCorners: roundedCorners)
    }
}
