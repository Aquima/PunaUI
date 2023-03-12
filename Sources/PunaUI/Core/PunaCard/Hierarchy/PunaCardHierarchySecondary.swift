//
//  PunaCardHierarchySecondary.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

struct PunaCardHierarchySecondary: PunaCardHierarchyProtocol {
    let backgroundColor: UIColor
    let cardShadow: PunaCardShadowConfig?
    let borderColor: UIColor?
    let pipeColor: UIColor

    init() {
        self.backgroundColor = UIColor.Puna.graySolid040
        self.cardShadow = nil
        self.borderColor = nil
        self.pipeColor = PunaCardTypeNone().pipeColor
    }
}
