//
//  PunaTextFieldCodeThreeByThree.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 18/09/2020.
//

import Foundation

final class PunaTextFieldCodeThreeByThree: PunaTextFieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTextFieldCodeThreeByThree", owner: self, options: nil)
    }
}
