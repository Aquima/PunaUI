//
//  PunaMessageWithActionsView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

class PunaMessageWithActionsView: PunaMessageAbstractView {
    @IBOutlet weak var primaryAction: PunaButton!
    @IBOutlet weak var secondaryAction: PunaButton!
    @IBOutlet weak var spacingBetweenBodyAndActions: NSLayoutConstraint!

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaMessageWithActionsView", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
        primaryAction.size = .medium
        secondaryAction.size = .medium

        if let primaryConfig = config.primaryActionConfig {
            primaryAction.updateWithCustomConfig(primaryConfig)
            spacingBetweenBodyAndActions.constant = 16.0
        }

        if let sConfig = config.secondaryActionConfig {
            secondaryAction.isHidden = false
            secondaryAction.updateWithCustomConfig(sConfig)
        } else {
            secondaryAction.isHidden = true
        }

        if let linkConfig = config.linkActionConfig {
            primaryAction.updateWithCustomConfig(linkConfig)
            spacingBetweenBodyAndActions.constant = 8.0
        }
    }

    @IBAction func primaryButtonTapped(_ sender: Any) {
        self.delegate?.primaryBtnTouchUp()
    }

    @IBAction func secondaryButtonTapped(_ sender: Any) {
        self.delegate?.secondaryBtnTouchUp()
    }
}
