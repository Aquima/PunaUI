//
//  PunaAutosuggestDefaultView.swift
//  PunaUI
//

import UIKit

class PunaAutosuggestDefaultView: PunaAutosuggestAbstractView {

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaAutosuggestDefaultView", owner: self, options: nil)
    }
}
