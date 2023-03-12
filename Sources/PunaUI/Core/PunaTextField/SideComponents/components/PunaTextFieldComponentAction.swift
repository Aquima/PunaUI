//
//  PunaTextFieldComponentAction.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation
@objc public class PunaTextFieldComponentAction: NSObject, PunaTextFieldRightComponent {
    public private(set) var visibility: PunaTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: PunaTextFieldComponentReloadPolicy = .always

    @objc public private(set) var label: String

    @objc public init(_ actionLabel: String) {
        label = actionLabel
    }

}
