//
//  PunaTextFieldViewDelegate.swift
//  PunaUI
//
//  Created by Martin Damico on 12/03/2020.
//

import Foundation
import UIKit

internal protocol PunaTextFieldViewDelegate: AnyObject {
    func didBeginEditing()
    func didEndEditing(text: String)
    func shouldBeginEditing() -> Bool
    func shouldEndEditing() -> Bool
    func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    func didChangeSelection(selectedRange range: UITextRange?)
    func didChange()
    func didTapRightAction()
    func shouldReturn() -> Bool
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool)
}

extension PunaTextFieldViewDelegate { // optional (implemented only on textfield or text area only)
    func didTapRightAction() {}
    func shouldReturn() -> Bool {return true}
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool) {}
}
