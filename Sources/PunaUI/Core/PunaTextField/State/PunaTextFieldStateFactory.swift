//
//  PunaTextFieldStateFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

internal class PunaTextFieldStateFactory {
    static func getState(_ state: PunaTextInputState, isEditing: Bool) -> PunaTextFieldStateProtocol {
        switch state {
        case .idle:
            return PunaTextFieldStateIdle(focuesd: isEditing)
        case .error:
            return PunaTextFieldStateError(focuesd: isEditing)
        case .disabled:
            return PunaTextFieldStateDisabled()
        case .readOnly:
            return PunaTextFieldStateReadonly()
        case .warning:
            return PunaTextFieldStateWarning(focuesd: isEditing)
        }
    }
}
