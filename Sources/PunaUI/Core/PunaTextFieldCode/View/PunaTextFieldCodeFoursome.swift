//
//  PunaTextFieldCodeFoursome.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

final class PunaTextFieldCodeFoursome: PunaTextFieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTextFieldCodeFoursome", owner: self, options: nil)
    }
}
