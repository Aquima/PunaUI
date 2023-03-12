//
//  PunaBodyLink.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import CoreFoundation

@objc public class PunaBodyLink: NSObject {
    var startIndex: Int
    var endIndex: Int

    @objc public init(startIndex: Int, endIndex: Int) {
        self.startIndex = startIndex
        self.endIndex = endIndex
    }

    func isValidRange(_ text: NSAttributedString) -> Bool {
        return (startIndex >= 0 && endIndex >= 0 && startIndex <= endIndex && endIndex <= text.length)
    }
}
