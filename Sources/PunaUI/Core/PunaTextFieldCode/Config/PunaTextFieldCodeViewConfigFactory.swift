//
//  PunaTextFieldCodeViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

final class PunaTextFieldCodeViewConfigFactory {

    static func provideInternalConfig(from textFieldCode: PunaTextFieldCode) -> PunaTextFieldCodeViewConfig {
        let stateStyle = PunaTextFieldCodeStateFactory.getState(textFieldCode.state)
        return PunaTextFieldCodeViewConfig(labelText: textFieldCode.label, helperText: textFieldCode.helpLabel, style: textFieldCode.style, state: textFieldCode.state, stateStyle: stateStyle)
    }
}
