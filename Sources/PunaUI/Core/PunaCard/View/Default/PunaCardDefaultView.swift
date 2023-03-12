//
//  PunaCardDefaultView.swift
//  PunaUI
//
//  Created by Martin Victory on 14/07/2020.
//

import UIKit

class PunaCardDefaultView: PunaCardAbstractView {
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaCardDefaultView", owner: self, options: nil)
    }
}
