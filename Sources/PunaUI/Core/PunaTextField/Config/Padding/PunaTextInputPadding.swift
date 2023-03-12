//
//  PunaFieldPadding.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
internal struct PunaTextInputPadding {
    let top: CGFloat
    let left: CGFloat
    let bottom: CGFloat
    let right: CGFloat

    static var defaultPadding: PunaTextInputPadding {
        return PunaTextInputPadding(top: 13, left: 12, bottom: 13, right: 12)
    }

    static var defaultAreaPadding: PunaTextInputPadding {
        return PunaTextInputPadding(top: 15, left: 7, bottom: 15, right: 7)
    }
}
