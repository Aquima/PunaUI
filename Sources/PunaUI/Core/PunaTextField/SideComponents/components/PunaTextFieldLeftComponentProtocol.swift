//
//  PunaTextFieldLeftComponentProtocol.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation

/// Component that can be placed on the left side of an PunaTextField
@objc public protocol PunaTextFieldLeftComponent {
    var visibility: PunaTextFieldComponentVisibility { get }
    var reloadPolicy: PunaTextFieldComponentReloadPolicy { get }
}
