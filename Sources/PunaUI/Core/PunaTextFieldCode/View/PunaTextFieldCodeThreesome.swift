//
//  PunaTextFieldCodeThreesome.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

final class PunaTextFieldCodeThreesome: PunaTextFieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTextFieldCodeThreesome", owner: self, options: nil)
    }
}
