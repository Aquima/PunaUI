//
//  PunaAutosuggestDatasource.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import UIKit

@objc public protocol PunaAutosuggestDatasource {
    @objc optional func PunaAutosuggestSuperView(_ autosuggest: PunaAutosuggest) -> UIView
    @objc func PunaAutosuggestSuggestions(_ autosuggest: PunaAutosuggest) -> [String]
}
