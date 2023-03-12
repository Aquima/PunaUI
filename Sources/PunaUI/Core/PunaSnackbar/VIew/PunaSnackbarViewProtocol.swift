//
//  PunaSnackbarViewProtocol.swift
//  PunaUI
//
//  Created by Samuel Sainz on 6/16/20.
//

import Foundation
import UIKit

protocol PunaSnackbarViewProtocol: UIView {
    var delegate: PunaSnackbarViewDelegate? { get set }
    var config: PunaSnackbarViewConfig { get set }
    func update(withConfig config: PunaSnackbarViewConfig)
    func updateButtonsLayout()
}
