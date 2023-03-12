//
//  PunaAutosuggestDelegate.swift
//  PunaUI
//

import UIKit

@objc public protocol PunaAutosuggestDelegate {
    // Text Input Delegate
    @objc optional func PunaAutosuggestShouldBeginEditing(_ autosuggest: PunaAutosuggest) -> Bool
    @objc optional func PunaAutosuggestShouldEndEditing(_ autosuggest: PunaAutosuggest) -> Bool
    @objc optional func PunaAutosuggestDidBeginEditing(_ autosuggest: PunaAutosuggest)
    @objc optional func PunaAutosuggestDidEndEditing(_ autosuggest: PunaAutosuggest)
    @objc optional func PunaAutosuggest(_ autosuggest: PunaAutosuggest, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    @objc optional func PunaAutosuggestDidChangeSelection(_ autosuggest: PunaAutosuggest, selectedRange range: UITextRange?)
    @objc optional func PunaAutosuggestDidChange(_ autosuggest: PunaAutosuggest)
    @objc optional func PunaAutosuggestDidTapRightAction(_ autosuggest: PunaAutosuggest)
    @objc optional func PunaAutosuggestShouldReturn(_ autosuggest: PunaAutosuggest) -> Bool
    @objc optional func PunaAutosuggest(_ autosuggest: PunaAutosuggest, didDeleteBackwardAnd wasEmpty: Bool)

    // Suggestions Delegate
    @objc optional func PunaAutosuggestSuggestionWasTapped(_ autosuggest: PunaAutosuggest, suggestion: String)
}
