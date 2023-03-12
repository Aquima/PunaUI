//
//  PunaTagSizeProtocol.swift
//  PunaUI
//
//  Created by Samuel Sainz on 5/28/20.
//

import Foundation
import UIKit

protocol PunaTagSizeProtocol {
    var font: UIFont { get }
    var height: CGFloat { get }
    var horizontalPadding: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var shouldShowLeftContent: Bool { get }
    var rightButtonWidth: CGFloat { get }
}
