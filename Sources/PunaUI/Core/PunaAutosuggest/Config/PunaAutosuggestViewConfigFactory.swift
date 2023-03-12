//
//  PunaAutosuggestViewConfigFactory.swift
//  PunaUI
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
