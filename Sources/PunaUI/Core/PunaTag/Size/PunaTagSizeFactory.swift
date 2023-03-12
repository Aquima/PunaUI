//
//  PunaTagSizeFactory.swift
//  PunaUI
//
//  Created by Samuel Sainz on 5/29/20.
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
