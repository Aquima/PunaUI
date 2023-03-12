//
//  PunaTabItem.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 21/07/21.
//

import Foundation

@objc public class PunaTabItem: NSObject {
    var title: String

    @objc public init(_ title: String) {
        self.title = title
    }
}
