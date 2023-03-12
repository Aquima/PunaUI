//
//  PunaBadgeView.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import Foundation
import UIKit
/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaBadge
 */
internal protocol PunaBadgeView: UIView {
    func update(withConfig config: PunaBadgeViewConfig)
}
