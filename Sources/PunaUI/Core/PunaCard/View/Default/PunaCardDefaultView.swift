//
//  PunaCardDefaultView.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import UIKit

class PunaCardDefaultView: PunaCardAbstractView {
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaCardDefaultView", owner: self, options: nil)
    }
}
