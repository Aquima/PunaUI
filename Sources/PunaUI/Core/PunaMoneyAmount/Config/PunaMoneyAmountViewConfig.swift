//
//  
//  PunaMoneyAmountViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// used to define the ui of internal PunaMoneyAmountPrice views
internal struct PunaMoneyAmountViewConfig {
    var type: PunaMoneyAmountType = .positive
    var decimalStyle: PunaMoneyAmountDecimalStyle = .normal
    var decimalSeparator: String = "."
    var amount: String = ""
    var labelSize: CGFloat = 0.0
    var superScriptSize: CGFloat = 0.0

    init() {}

    init(type: PunaMoneyAmountType, decimalStyle: PunaMoneyAmountDecimalStyle, decimalSeparator: String, amount: String, labelSize: CGFloat, superScripSize: CGFloat) {
        self.type = type
        self.decimalStyle = decimalStyle
        self.decimalSeparator = decimalSeparator
        self.amount = amount
        self.labelSize = labelSize
        self.superScriptSize = superScripSize
    }
}
