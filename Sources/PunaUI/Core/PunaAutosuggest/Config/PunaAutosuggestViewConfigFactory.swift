//
//  PunaAutosuggestViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import UIKit

class PunaAutosuggestViewConfigFactory: NSObject {
    static func provideInternalConfig(autosuggest: PunaAutosuggest) -> PunaAutosuggestViewConfig {
        return PunaAutosuggestViewConfig(
            state: autosuggest.state,
            label: autosuggest.label,
            helper: autosuggest.helper,
            counter: autosuggest.counter,
            placeholder: autosuggest.placeholder,
            leftContent: autosuggest.leftContent,
            rightContent: autosuggest.rightContent,
            inputTraits: autosuggest.inputTraits)
    }
}
