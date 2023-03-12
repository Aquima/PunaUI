//
//  PunaTextFieldComponentProgressIndicator.swift
//  PunaUI
//
//  Created by Santiago Lazzari on 14/05/2021.
//

import UIKit

@objc public class PunaTextFieldComponentProgressIndicator: NSObject, PunaTextFieldRightComponent {
    public private(set) var visibility: PunaTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: PunaTextFieldComponentReloadPolicy = .onlyOneTime

    @objc public private(set) var tintColor: UIColor = .clear

    @objc public convenience init(tintColor: UIColor) {
        self.init()
        self.tintColor = tintColor
    }
}
