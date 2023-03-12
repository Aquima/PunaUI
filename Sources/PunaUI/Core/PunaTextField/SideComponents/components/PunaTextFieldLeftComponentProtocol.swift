//
//  PunaTextFieldLeftComponentProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// Component that can be placed on the left side of an PunaTextField
@objc public protocol PunaTextFieldLeftComponent {
    var visibility: PunaTextFieldComponentVisibility { get }
    var reloadPolicy: PunaTextFieldComponentReloadPolicy { get }
}
