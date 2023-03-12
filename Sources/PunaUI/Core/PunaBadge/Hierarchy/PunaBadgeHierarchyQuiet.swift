//
//  PunaBadgeHierarchyQuiet.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import Foundation
import UIKit

struct PunaBadgeHierarchyQuiet: PunaBadgeHierarchyProtocol {
    var backgroundColor: UIColor
    var textColor: UIColor

    init(type: PunaBadgeTypeProtocol) {
        backgroundColor = type.secondaryColor
        textColor = type.primaryColor
    }
}
