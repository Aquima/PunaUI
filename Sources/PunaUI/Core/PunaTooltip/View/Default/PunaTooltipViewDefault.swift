//
//  
//  PunaTooltipViewDefault.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
