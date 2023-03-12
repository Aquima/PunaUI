//
//  PunaAutosuggestDefaultView.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import UIKit

class PunaAutosuggestDefaultView: PunaAutosuggestAbstractView {

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaAutosuggestDefaultView", owner: self, options: nil)
    }
}
