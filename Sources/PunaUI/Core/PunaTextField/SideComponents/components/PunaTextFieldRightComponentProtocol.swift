//
//  RightComponentProtocol.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 3/23/20.
//

import UIKit

/// Component that can be placed on the right side of an PunaTextField
@objc public protocol PunaTextFieldRightComponent {
    var visibility: PunaTextFieldComponentVisibility { get }
    var reloadPolicy: PunaTextFieldComponentReloadPolicy { get }
}
