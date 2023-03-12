//
//  
//  PunaMoneyAmountComboView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaMoneyAmountCombo
 */
internal protocol PunaMoneyAmountComboView: UIView {
    func update(withConfig config: PunaMoneyAmountComboViewConfig)
}
