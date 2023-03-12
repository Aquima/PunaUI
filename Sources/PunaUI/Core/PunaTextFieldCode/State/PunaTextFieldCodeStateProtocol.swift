//
//  PunaTextFieldCodeStateProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

protocol PunaTextFieldCodeStateProtocol {
    var labelTextColor: UIColor { get }
    var helperTextColor: UIColor { get }
    var helperSemibold: Bool { get }
    var helperIconName: String? { get }
    var helperIconTintColor: UIColor? { get }
    var helperIconBgColor: UIColor { get }
}
