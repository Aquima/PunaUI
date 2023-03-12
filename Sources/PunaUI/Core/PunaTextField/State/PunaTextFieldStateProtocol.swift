//
//  PunaTextFieldStateProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal protocol PunaTextFieldStateProtocol {
    var borderColor: UIColor { get }
    var borderWidth: CGFloat { get }
    var borderDashed: Bool { get }

    var labelTextColor: UIColor { get }

    var helperColor: UIColor { get }
    var helperIconTintColor: UIColor? { get }
    var helperIconName: String? { get }
    var helperSemibold: Bool { get }

    var backgroundColor: UIColor { get }
    var inputTextColor: UIColor { get }
    var editingEnabled: Bool { get }

    var placeholderTextColor: UIColor { get }
}
