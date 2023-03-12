//
//  PunaTextFieldCodeView.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
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
