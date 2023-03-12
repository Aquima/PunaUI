//
//  PunaBadgeSizeProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import UIKit

internal protocol PunaBadgeSizeProtocol {
    var font: UIFont { get }
    var lineSpacing: CGFloat { get }
    var height: CGFloat { get }
    var borderRadius: CGFloat { get }
    var verticalPadding: CGFloat { get }
}
