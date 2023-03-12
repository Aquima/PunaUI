//
//  PunaTooltipTypeHighlight.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 08-02-21.
//

import Foundation
import UIKit

struct PunaTooltipTypeHighlight: PunaTooltipTypeProtocol {
    let textColor = UIColor.Puna.white
    let backgroundColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
    let maxWidth: CGFloat = 260
    let shadowOffset: CGSize = CGSize(width: 0, height: 0)
    let shadowRadius: CGFloat = 6
    let shadowOpacity: CGFloat = 0.3
    let closeButtonColor: UIColor = UIColor.Puna.white
    let shadowColor: UIColor = UIColor.Puna.graySolid800
}
