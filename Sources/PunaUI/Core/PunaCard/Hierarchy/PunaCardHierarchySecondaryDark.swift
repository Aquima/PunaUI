//
//  PunaCardHierarchySecondaryDark.swift
//  PunaUI
//
//  Created by Martin Victory on 22/07/2020.
//

import Foundation
import UIKit

struct PunaCardHierarchySecondaryDark: PunaCardHierarchyProtocol {
    let backgroundColor: UIColor
    let cardShadow: PunaCardShadowConfig?
    let borderColor: UIColor?
    let pipeColor: UIColor

    init() {
        self.backgroundColor = UIColor.Puna.graySolid070
        self.cardShadow = nil
        self.borderColor = nil
        self.pipeColor = PunaCardTypeNone().pipeColor
    }
}
