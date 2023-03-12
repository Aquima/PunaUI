//
//  PunaBadgeSizeProtocol.swift
//  PunaUI
//
import UIKit

internal protocol PunaBadgeSizeProtocol {
    var font: UIFont { get }
    var lineSpacing: CGFloat { get }
    var height: CGFloat { get }
    var borderRadius: CGFloat { get }
    var verticalPadding: CGFloat { get }
}
