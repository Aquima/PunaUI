//
//  PunaTextInputPaddingFactory.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/24/20.
//

import Foundation

class PunaTextInputPaddingFactory {
    static func providePaddingForField(state: PunaTextInputState) -> PunaTextInputPadding {
        switch state {
        case .readOnly:
            return PunaTextInputPadding(top: 13, left: 4, bottom: 13, right: 4)
        default:
            return PunaTextInputPadding.defaultPadding
        }
    }

    static func providePaddingForArea(state: PunaTextInputState) -> PunaTextInputPadding {
        switch state {
        case .readOnly:
            return PunaTextInputPadding(top: 15, left: 0, bottom: 15, right: 0)
        default:
            return PunaTextInputPadding.defaultAreaPadding
        }
    }
}
