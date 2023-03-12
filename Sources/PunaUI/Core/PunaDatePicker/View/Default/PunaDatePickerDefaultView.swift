//
//  PunaDatePickerDefaultView.swift
//  PunaUI
//
//  Created by Ândriu Felipe Coelho on 08/11/20.
//

import Foundation

internal class PunaDatePickerDefaultView: PunaDatePickerAbstractView {

    // MARK: - Instantiate

    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaDatePickerDefaultView", owner: self, options: nil)
    }
}
