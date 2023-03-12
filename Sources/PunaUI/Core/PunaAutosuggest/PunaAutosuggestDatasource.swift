//
//  PunaAutosuggestDatasource.swift
//  PunaUI
//

import UIKit

@objc public protocol PunaAutosuggestDatasource {
    @objc optional func PunaAutosuggestSuperView(_ autosuggest: PunaAutosuggest) -> UIView
    @objc func PunaAutosuggestSuggestions(_ autosuggest: PunaAutosuggest) -> [String]
}
