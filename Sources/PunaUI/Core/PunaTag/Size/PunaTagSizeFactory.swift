//
//  PunaTagSizeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaTagSizeFactory {
    static func provide(_ type: PunaTagSize) -> PunaTagSizeProtocol {
        switch type {
        case .large:
            return PunaTagSizeLarge()
        case .small:
            return PunaTagSizeSmall()
        }
    }
}
