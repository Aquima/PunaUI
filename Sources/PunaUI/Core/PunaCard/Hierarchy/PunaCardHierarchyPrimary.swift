//
//  PunaCardHierarchyPrimary.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
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
