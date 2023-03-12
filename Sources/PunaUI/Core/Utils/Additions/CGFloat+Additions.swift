//
//  CGFloat+Additions.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

extension CGFloat {
    func sign() -> CGFloat {
        return self > 0 ? 1.0 : -1.0
    }

    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
