//
//  PunaCheckboxStatusFactory.swift
//  PunaUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
class PunaCheckboxStatusFactory {
    static func provide(_ type: PunaCheckboxStatus) -> PunaCheckboxStatusProtocol {
        switch type {
        case .selected:
            return PunaCheckboxStatusSelected()
        case .undefined:
            return PunaCheckboxStatusUndefined()
        case .unselected:
            return PunaCheckboxStatusUnselected()
        }
    }
}
