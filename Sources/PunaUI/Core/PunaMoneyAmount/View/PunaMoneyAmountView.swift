//
//  
//  PunaMoneyAmountView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit
/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaMoneyAmount
 */
internal protocol PunaMoneyAmountView: UIView {
    func update(withConfig config: PunaMoneyAmountViewConfig)
}
