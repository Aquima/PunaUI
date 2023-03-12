//
//  PunaCardStyleElevated.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

struct PunaCardStyleElevated: PunaCardStyleProtocol {
    let shadow: PunaCardShadowConfig?
    let borderColor: UIColor?

    init() {
        self.shadow = PunaCardShadowConfig(shadowColor: .black,
                                            shadowOffset: CGSize(width: 0, height: 6),
                                            shadowRadius: 16,
                                            shadowOpacity: 0.1)
        self.borderColor = nil
    }
}
