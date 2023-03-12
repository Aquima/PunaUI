//
//  PunaTextFieldCodeThreesome.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

final class PunaTextFieldCodeThreesome: PunaTextFieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTextFieldCodeThreesome", owner: self, options: nil)
    }
}
