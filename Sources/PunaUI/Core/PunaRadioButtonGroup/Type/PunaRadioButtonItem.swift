//
//  PunaRadioButtonItem.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public class PunaRadioButtonItem: NSObject {
    var text: String
    var type: PunaRadioButtonType

    @objc public init(_ text: String, _ type: PunaRadioButtonType) {
        self.text = text
        self.type = type
    }
}
