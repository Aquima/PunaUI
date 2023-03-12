//
//  PunaRadioButtonItem.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 10/06/21.
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
