//
//  PunaBadgeTypeHighlight.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import Foundation
import UIKit

class PunaBadgeTypeHighlight: PunaBadgeTypeProtocol {
    var primaryColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
    var secondaryColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor100

    func getIcon(size: PunaBadgeSize) -> String {
        switch size {
        case .large:
            return PunaIcons.feedbackHighlight24
        case .small:
            return PunaIcons.feedbackHighlight16
        }
    }
}
