//
//  PunaTooltipTypeDark.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaTooltipTypeDark: PunaTooltipTypeProtocol {
    let textColor: UIColor = UIColor.Puna.white
    let backgroundColor: UIColor = UIColor.Puna.graySolid800
    let maxWidth: CGFloat = 260
    let shadowOffset: CGSize = CGSize(width: 0, height: 0)
    let shadowRadius: CGFloat = 6
    let shadowOpacity: CGFloat = 0.3
    let closeButtonColor: UIColor = UIColor.Puna.white
    var shadowColor: UIColor = UIColor.Puna.graySolid800
}
