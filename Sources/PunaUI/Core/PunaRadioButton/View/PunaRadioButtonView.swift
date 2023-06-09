//
//  PunaRadioButtonView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/**
Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaRadioButton
*/
internal protocol PunaRadioButtonView: UIView {
    // expose behaviour to PunaCheckbox common to all Puna Views
    var delegate: PunaRadioButtonViewDelegate? { get set }
    func update(withConfig config: PunaRadioButtonConfig)
}
