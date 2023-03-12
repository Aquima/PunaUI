//
//  PunaTagStateIdle.swift
//  PunaUI
//
//  Created by Facundo Conil on 9/28/20.
//

import Foundation
import UIKit

struct PunaTagStateIdle: PunaTagStateProtocol {

    var textColor: UIColor = PunaStyleSheetManager.styleSheet.textColorPrimary

    var borderColor: UIColor = UIColor.Puna.gray250

    var buttonColor: UIColor = UIColor.Puna.gray900

    var backgroundColor: UIColor = UIColor.clear

    var rightButtonImageName: String?

}
