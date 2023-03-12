//
//  
//  PunaTooltipTypeProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal protocol PunaTooltipTypeProtocol {
    var textColor: UIColor { get }
    var closeButtonColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var maxWidth: CGFloat { get }
    var shadowOffset: CGSize { get }
    var shadowRadius: CGFloat { get }
    var shadowOpacity: CGFloat { get }
    var shadowColor: UIColor { get }
}
