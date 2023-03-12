//
//  PunaBadgeTypeWarning.swift
//  PunaUI
//

import Foundation
import UIKit

class PunaBadgeTypeWarning: PunaBadgeTypeProtocol {
    var primaryColor: UIColor = UIColor.Puna.orange500
    var secondaryColor: UIColor = UIColor.Puna.orange100

    func getIcon(size: PunaBadgeSize) -> String {
        switch size {
        case .large:
            return PunaIcons.feedbackWarning24
        case .small:
            return PunaIcons.feedbackWarning16
        }
    }
}
