//
//  PunaTagStateFactory.swift
//  PunaUI
//
//  Created by Facundo Conil on 9/28/20.
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
