//
//  PunaBadgeHierarchyQuiet.swift
//  PunaUI
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
