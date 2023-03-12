//
//  PunaTabsStyle.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

struct PunaTabsStyle {
    let accentColor: UIColor = PunaStyleSheetManager.styleSheet.accentColor
    let textColor: UIColor = PunaStyleSheetManager.styleSheet.textColorPrimary
    let PunaStyle: PunaFontStyle = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary, font: PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 14), lineSpacing: 1.25)
    let backgroundColor: UIColor = PunaStyleSheetManager.styleSheet.bgColorWhite
    let bottomIndicatorLineColor: UIColor = UIColor.Puna.gray100
    let lineBreakMode: NSLineBreakMode = .byTruncatingTail
    let textAlignment: NSTextAlignment = .center
}
