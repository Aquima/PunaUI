//
//  PunaBadgeHierarchyLoud.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
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
