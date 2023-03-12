//
//  
//  PunaProgressIndicatorViewDefault.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

class PunaProgressIndicatorViewCircular: PunaProgressIndicatorAbstractView {

    private let progressValue: CGFloat = 1

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaProgressIndicatorViewCircular", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
        self.circularProgressBar.progress = progressValue
    }
}
