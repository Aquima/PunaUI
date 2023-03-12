//
//  PunaTooltipViewLink.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 09-02-21.
//

import Foundation

class PunaTooltipViewActions: PunaTooltipAbstractView {

    @IBOutlet weak var secondaryAction: PunaButton!
    @IBOutlet weak var primaryAction: PunaButton!
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTooltipViewActions", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
        self.updatePrimaryAction()
        self.updateSecondaryActionIfNeeded()
    }

    private func updatePrimaryAction() {
        if let primaryActionConfig = config.primaryActionConfig {
            primaryAction.updateWithCustomConfig(primaryActionConfig)
        }
    }

    private func updateSecondaryActionIfNeeded() {
        guard let secondaryActionConfig = config.secondaryActionConfig else {
            hideSecondaryButton()
            return
        }
        secondaryAction.updateWithCustomConfig(secondaryActionConfig)
    }

    private func hideSecondaryButton() {
        secondaryAction.removeFromSuperview()
    }

    @IBAction func primaryActionButtonTapped(_ sender: Any) {
        config.primaryActionOnPressed?()
        dismiss()
    }

    @IBAction func secondaryActionButtonTapped(_ sender: Any) {
        config.secondaryActionOnPressed?()
        dismiss()
    }
}
