//
//  
//  PunaMoneyAmountView.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 24/08/21.
//
//

import Foundation
import UIKit
/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaMoneyAmount
 */
internal protocol PunaMoneyAmountView: UIView {
    func update(withConfig config: PunaMoneyAmountViewConfig)
}
