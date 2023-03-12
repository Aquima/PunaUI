//
//  
//  PunaMoneyAmountComboView.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 6/09/21.
//
//

import Foundation
import UIKit

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaMoneyAmountCombo
 */
internal protocol PunaMoneyAmountComboView: UIView {
    func update(withConfig config: PunaMoneyAmountComboViewConfig)
}
