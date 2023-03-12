//
//  
//  PunaTabsViewDefault.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaTabsViewDefault: PunaTabsAbstractView {
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTabsViewDefault", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
    }
}
