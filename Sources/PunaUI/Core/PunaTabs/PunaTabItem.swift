//
//  PunaTabItem.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public class PunaTabItem: NSObject {
    var title: String

    @objc public init(_ title: String) {
        self.title = title
    }
}
