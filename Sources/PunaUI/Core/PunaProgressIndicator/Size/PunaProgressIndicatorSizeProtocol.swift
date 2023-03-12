//
//  PunaProgressIndicatorSizeProtocol.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-20.
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
