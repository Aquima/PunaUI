//
//  PunaSnackbarConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaSnackbarViewConfigFactory {

    static func provideInternalConfig(from snackbar: PunaSnackbar) -> PunaSnackbarViewConfig {

        let text = snackbar.text
        let bgColor = snackbar.type.toColor()

        if let action = snackbar.action {
            let actionText = action.text
            let actionConfig = PunaButtonViewConfigFactory.provide(hierarchy: PunaSnackbarButtonHierarchy(), size: PunaSnackbarButtonSize(), text: actionText, icon: nil)
            return PunaSnackbarViewConfig(text: text, backgroundColor: bgColor, actionConfig: actionConfig)
        }

        return PunaSnackbarViewConfig(text: text, backgroundColor: bgColor)
    }
}
