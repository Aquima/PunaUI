//
//  PunaTextFieldCodeView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit
/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaTextFieldCode.
 */
protocol PunaTextFieldCodeView: UIView {
    var text: String { get }
    var delegate: PunaTextFieldCodeDelegate? { get set }
    func setText(_ newValue: String)
    func update(withConfig config: PunaTextFieldCodeViewConfig)
    func setFocus()
    func removeFocus()
}
