//
//  PunaBadgeHierarchyLoud.swift
//  PunaUI
//

import Foundation
import UIKit

struct PunaBadgeHierarchyLoud: PunaBadgeHierarchyProtocol {
    var backgroundColor: UIColor
    var textColor: UIColor

    init(type: PunaBadgeTypeProtocol) {
        backgroundColor = type.primaryColor
        textColor = PunaStyleSheetManager.styleSheet.textColorWhite
    }
}
