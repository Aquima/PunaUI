//
//  
//  PunaTabsViewDefault.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 21/07/21.
//
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
