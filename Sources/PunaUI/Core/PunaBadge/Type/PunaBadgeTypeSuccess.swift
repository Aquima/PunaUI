//
//  PunaBadgeTypeSuccess.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import Foundation
import UIKit

class PunaBadgeTypeSuccess: PunaBadgeTypeProtocol {
    var primaryColor: UIColor = UIColor.Puna.green500
    var secondaryColor: UIColor = UIColor.Puna.green100

    func getIcon(size: PunaBadgeSize) -> String {
        switch size {
        case .large:
            return PunaIcons.feedbackSuccess24
        case .small:
            return PunaIcons.feedbackSuccess16
        }
    }
}
