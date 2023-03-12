//
//  PunaAutosuggestView.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

internal protocol PunaAutosuggestViewDatasource: AnyObject {
    func suggestions() -> [String]
    func superView() -> UIView
}

internal protocol PunaAutosuggestViewDelegate: AnyObject {
    // Text input delegate
    func didBeginEditing()
    func didEndEditing(text: String)
    func shouldBeginEditing() -> Bool
    func shouldEndEditing() -> Bool
    func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func didChangeSelection(selectedRange range: UITextRange?)
    func didChange()
    func didTapRightAction()
    func shouldReturn() -> Bool
    func didDeleteBackward(_ andWasEmpty: Bool)

    // Suggestions delegate
    func suggestionWasTapped(suggestion: String)
}

internal protocol PunaAutosuggestView: UIView {
//    Attributes
    var delegate: PunaAutosuggestViewDelegate! { get set }
    var datasource: PunaAutosuggestViewDatasource! { get set }
    var text: String { get set } // input text

//    Methods
    func update(with config: PunaAutosuggestViewConfig)
    func reloadData()
    func showSuggestions(availableFrame: CGRect)
    func hideSuggestions()
}
