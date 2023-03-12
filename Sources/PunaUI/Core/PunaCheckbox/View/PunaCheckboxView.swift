//
//  PunaCheckboxView.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/15/20.
//

import Foundation
import UIKit

/**
Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaCheckbox
*/

internal protocol PunaCheckboxView: UIView {
    // expose behaviour to PunaCheckbox common to all Puna Views
    var delegate: PunaCheckboxViewDelegate? { get set }
    func update(withConfig config: PunaCheckboxViewConfig)

}
