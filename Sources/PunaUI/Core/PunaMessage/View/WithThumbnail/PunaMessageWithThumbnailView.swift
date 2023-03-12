//
//  PunaMessageWithThumbnailView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaMessageWithThumbnailView: PunaMessageAbstractView {

    @IBOutlet weak var thumbnail: PunaThumbnail!

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaMessageWithThumbnailView", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
        guard let thumbnail = config.thumbnail else { return }
        self.thumbnail.image = thumbnail
    }
}
