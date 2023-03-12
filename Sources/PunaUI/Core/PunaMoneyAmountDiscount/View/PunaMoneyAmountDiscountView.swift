//
//  
//  PunaDiscountView.swift
//  PunaUI
//
//  Created by Ana Cristina Calderon Castrillon on 1/09/21.
//
//

import Foundation
import UIKit

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaDiscount
 */
internal protocol PunaMoneyAmountDiscountView: UIView {
    func update(withConfig config: PunaMoneyAmountDiscountViewConfig)
}
