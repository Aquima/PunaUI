//
//  PunaTextFieldView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal protocol PunaTextFieldView: UIView {
    // expose behaviour to PunaMessage common to all Message Views
    var delegate: PunaTextFieldViewDelegate? { get set }

    var text: String { get set } // input text
    var attributeText: NSAttributedString? { get set }
    var config: PunaTextFieldViewConfig { get }
    var textInputView: UIView { get }
    var customInputView: UIView? {get set}
    var innerTextField: UITextField? { get }
    var customInputAccessoryView: UIView? { get set }
    func update(withConfig config: PunaTextFieldViewConfig)
    func clear()
}
