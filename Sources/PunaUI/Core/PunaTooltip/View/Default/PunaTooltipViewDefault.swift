//
//  
//  PunaTooltipViewDefault.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 19-01-21.
//
//

import Foundation
import UIKit

class PunaTooltipViewDefault: PunaTooltipAbstractView {

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTooltipViewDefault", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
    }

}
