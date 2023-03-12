//
//  
//  PunaTooltipTypeLight.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 19-01-21.
//
//

import Foundation
import UIKit

struct PunaTooltipTypeLight: PunaTooltipTypeProtocol {
    let textColor: UIColor = UIColor.Puna.graySolid800
    let backgroundColor: UIColor = UIColor.Puna.white
    let maxWidth: CGFloat = 260
    let shadowOffset: CGSize = CGSize(width: 0, height: 0)
    let shadowRadius: CGFloat = 6
    let shadowOpacity: CGFloat = 0.3
    let closeButtonColor: UIColor = UIColor.Puna.graySolid800
    let shadowColor: UIColor = UIColor.Puna.graySolid800
}
