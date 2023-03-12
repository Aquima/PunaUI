//
//  PunaCheckboxStatusFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 29/03/2021.
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
