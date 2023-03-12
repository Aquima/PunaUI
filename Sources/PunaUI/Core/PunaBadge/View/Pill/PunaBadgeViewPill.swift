//
//  PunaBadgeViewPill.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

class PunaBadgeViewPill: PunaBadgeAbstractView {
    @IBOutlet weak var textLabel: UILabel!

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!

    @IBOutlet weak var left: NSLayoutConstraint!
    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBOutlet weak var right: NSLayoutConstraint!

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaBadgeViewPill", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()

        textLabel.setPunaStyle(style: config.textStyle!)
        textLabel.text = config.text
        textLabel.textAlignment = .center

        heightConstraint.constant = config.height!
        widthConstraint.constant = config.height!
        bottom.constant = config.verticalPadding!
        top.constant = config.verticalPadding!

        let cornerRadius = config.cornerRadius
        let roundedCorners = config.roundedCorners

        self.setCornerRadius(cornerRadius: cornerRadius, roundedCorners: roundedCorners)
    }
}
