//
//  PunaBadgeTypeProtocol.swift
//  PunaUI
//

import Foundation
import UIKit

@objc protocol PunaBadgeTypeProtocol {
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    @objc optional func getIcon(size: PunaBadgeSize) -> String
}
