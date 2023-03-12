//
//  PunaTextFieldCodeFoursome.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

final class PunaTextFieldCodeFoursome: PunaTextFieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTextFieldCodeFoursome", owner: self, options: nil)
    }
}
