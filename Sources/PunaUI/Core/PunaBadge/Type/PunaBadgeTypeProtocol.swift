//
//  PunaBadgeTypeProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import Foundation
import UIKit

@objc protocol PunaBadgeTypeProtocol {
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    @objc optional func getIcon(size: PunaBadgeSize) -> String
}
