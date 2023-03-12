//
//  PunaButtonSize.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

/**
 The PunaButtonSizeProtocol provides the differents attributes that define the size of the button, these can be constants or calculated
 */
internal protocol PunaButtonSizeProtocol {

    var font: UIFont { get }
    var height: CGFloat { get }
    var borderRadius: CGFloat { get }
    var padding: CGFloat { get }

    var spinnerSize: PunaProgressIndicatorSize { get }
}
