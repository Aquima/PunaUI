//
//  RightComponentProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

/// Component that can be placed on the right side of an PunaTextField
@objc public protocol PunaTextFieldRightComponent {
    var visibility: PunaTextFieldComponentVisibility { get }
    var reloadPolicy: PunaTextFieldComponentReloadPolicy { get }
}
