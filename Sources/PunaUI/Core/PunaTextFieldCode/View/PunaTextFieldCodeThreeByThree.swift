//
//  PunaTextFieldCodeThreeByThree.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

final class PunaTextFieldCodeThreeByThree: PunaTextFieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTextFieldCodeThreeByThree", owner: self, options: nil)
    }
}
