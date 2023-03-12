//
//  PunaCardHierarchyPrimary.swift
//  PunaUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation
import UIKit

struct PunaCardHierarchyPrimary: PunaCardHierarchyProtocol {
    let backgroundColor: UIColor
    let cardShadow: PunaCardShadowConfig?
    let borderColor: UIColor?
    let pipeColor: UIColor

    init(style: PunaCardStyleProtocol, type: PunaCardTypeProtocol) {
        backgroundColor = .white
        cardShadow = style.shadow
        borderColor = style.borderColor
        pipeColor = type.pipeColor
    }
}
