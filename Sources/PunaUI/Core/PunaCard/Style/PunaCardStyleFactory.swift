//
//  PunaCardStyleFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
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
