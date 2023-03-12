//
//  PunaProgressIndicatorSizeProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/**
 The PunaProgressIndicatorSizeProtocol provides the differents attributes that define the size of the Indicator, these can be constants or calculated
 */
internal protocol PunaProgressIndicatorSizeProtocol {
    var strokeWidth: CGFloat { get }
    var height: CGFloat { get }
    var textSpacing: CGFloat { get }

    var textFont: UIFont { get }
    var horizontalDistribution: Bool { get }
}
