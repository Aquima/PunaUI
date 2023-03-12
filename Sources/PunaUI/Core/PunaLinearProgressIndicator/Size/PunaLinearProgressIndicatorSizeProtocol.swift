//
//  PunaLinearProgressIndicatorSizeProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation

/**
 The PunaLinearProgressIndicatorSizeProtocol provides the differents attributes that define the size of the Indicator, these can be constants or calculated
 */
internal protocol PunaLinearProgressIndicatorSizeProtocol {
    var height: CGFloat { get }
    var splitSize: CGFloat { get }
    var cornerRadius: CGFloat { get }
}
