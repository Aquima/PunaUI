//
//  PunaTextFieldDelegate.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 3/31/20.
//

import Foundation
import UIKit

/// Delegation of PunaTextField behaviour
@objc public protocol PunaTextFieldDelegate {
    /// Called directly from UITextField ShouldBeginEditing
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func PunaTextFieldShouldBeginEditing(_ textField: PunaTextField) -> Bool

    /// Called directly from UITextField ShouldEndEditing
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func PunaTextFieldShouldEndEditing(_ textField: PunaTextField) -> Bool

    /// Called directly from UITextField didBeginEditing
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func PunaTextFieldDidBeginEditing(_ textField: PunaTextField)

    /// Called directly from UITextField DidEndEditing
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func PunaTextFieldDidEndEditing(_ textField: PunaTextField)

    /// Called directly from UITextField shouldChangeCharactersIn
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func PunaTextField(_ textField: PunaTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool

    /// Called directly from UITextField didChangeSelection
    /// - Parameter textField: the textfield that's triggering the event
    @available(iOS 13, *)
    @objc optional func PunaTextFieldDidChangeSelection(_ textField: PunaTextField, selectedRange range: UITextRange?)

    /// Called directly from UITextField didChange action
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func PunaTextFieldDidChange(_ textField: PunaTextField)

    /// Called on action button touched up
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func PunaTextFieldDidTapRightAction(_ textField: PunaTextField)

    /// Asks the delegate if the text field should process the pressing of the return button.
    /// - Parameter textField: the textfield that's triggering the event
    @objc optional func PunaTextFieldShouldReturn(_ textField: PunaTextField) -> Bool

    /// Asks the delegate if the deleteBackward key was pressed.
    /// - Parameter textField: the textfield that's triggering the event
    /// - Parameter wasEmpty: notifies if the textField text was empty before deleteBackward key was pressed.
    @objc optional func PunaTextField(_ textField: PunaTextField, didDeleteBackwardAnd wasEmpty: Bool)
}
