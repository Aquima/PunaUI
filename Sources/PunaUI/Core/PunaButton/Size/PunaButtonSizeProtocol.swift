//
//  PunaButtonSize.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 17/12/2019.
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
