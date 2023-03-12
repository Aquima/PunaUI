//
//  PunaTextFieldViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal class PunaTextFieldViewConfigFactory {
    static func provideInternalConfig(from textField: PunaTextField) -> PunaTextFieldViewConfig {

        let stateStyle = PunaTextFieldStateFactory.getState(textField.state, isEditing: textField.isEditing)
        let paddings = PunaTextInputPaddingFactory.providePaddingForField(state: textField.state)

        let config = PunaTextFieldViewConfig(labelText: textField.label,
                                              helperText: textField.helper,
                                              counter: textField.counter,
                                              placeholderText: textField.placeholder,
                                              stateStyle: stateStyle,
                                              leftViewComponent: textField.leftContent,
                                              rightViewComponent: textField.rightContent,
                                              inputTraits: textField.inputTraits,
                                              paddings: paddings,
                                              accessibilityActivated: textField.accessibilityManager?.accessibilityActivated)

        return config
    }

    static func provideInternalConfig(from textArea: PunaTextArea) -> PunaTextFieldViewConfig {

        let stateStyle = PunaTextFieldStateFactory.getState(textArea.state, isEditing: textArea.isEditing)
        let paddings = PunaTextInputPaddingFactory.providePaddingForArea(state: textArea.state)

        let config = PunaTextFieldViewConfig(labelText: textArea.label,
                                              helperText: textArea.helper,
                                              counter: textArea.counter,
                                              placeholderText: textArea.placeholder,
                                              stateStyle: stateStyle,
                                              leftViewComponent: nil,
                                              rightViewComponent: nil,
                                              inputTraits: textArea.inputTraits,
                                              maxLines: textArea.maxLines,
                                              paddings: paddings,
                                              accessibilityActivated: nil)

        return config
    }
}
