//
//  PunaBadgeTypeError.swift
//  PunaUI
//

import Foundation
import UIKit

class PunaBadgeTypeError: PunaBadgeTypeProtocol {
    var primaryColor: UIColor = UIColor.Puna.red500
    var secondaryColor: UIColor = UIColor.Puna.red100

    func getIcon(size: PunaBadgeSize) -> String {
        switch size {
        case .large:
            return PunaIcons.feedbackError24
        case .small:
            return PunaIcons.feedbackError16
        }
    }
}
