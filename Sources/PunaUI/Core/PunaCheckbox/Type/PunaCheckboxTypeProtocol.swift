//
//  PunaCheckboxTypeProtocol.swift
//  PunaUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
import UIKit

internal protocol PunaCheckboxTypeProtocol {
    var borderColor: UIColor? { get }
    var textColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var iconColor: UIColor? { get }
    var cornerRadius: CGFloat { get }
    var borderSize: CGFloat? { get }
}
