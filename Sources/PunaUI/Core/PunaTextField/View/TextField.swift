//
//  TextField.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

// Internal class created so as to handle deleteBackward action
final class TextField: UITextField {
    override func deleteBackward() {
        let wasEmpty = text?.isEmpty ?? true
        super.deleteBackward()
        (delegate as? TextFieldDelegate)?.textField(self, didDeleteBackwardAnd: wasEmpty)
    }
}

protocol TextFieldDelegate: UITextFieldDelegate {
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool)
}
