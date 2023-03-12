//
//  PunaMessageWithThumbnailAndActionsView.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 19-03-21.
//

import Foundation

class PunaMessageWithThumbnailAndActionsView: PunaMessageWithActionsView {

    @IBOutlet weak var thumbnail: PunaThumbnail!

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaMessageWithThumbnailAndActionsView", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
        guard let thumbnail = config.thumbnail else { return }
        self.thumbnail.image = thumbnail
    }
}
