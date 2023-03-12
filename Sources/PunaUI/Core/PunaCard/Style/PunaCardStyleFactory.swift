//
//  PunaCardStyleFactory.swift
//  PunaUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation

internal class PunaCardStyleFactory {
    static func provide(_ style: PunaCardStyle) -> PunaCardStyleProtocol {
        switch style {
        case .elevated:
            return PunaCardStyleElevated()
        case .outline:
            return PunaCardStyleOutline()
        }
    }
}
