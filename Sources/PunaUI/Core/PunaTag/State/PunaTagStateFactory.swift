//
//  PunaTagStateFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaTagStateFactory {
    static func provide(_ state: PunaTagState) -> PunaTagStateProtocol {
        switch state {
        case .idle:
            return PunaTagStateIdle()
        case .selected:
            return PunaTagStateSelected()
        }
    }
}
