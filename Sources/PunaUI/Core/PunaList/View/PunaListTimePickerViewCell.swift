//
//  PunaListTimePickerViewCell.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

class PunaListTimePickerViewCell: PunaListCell {
    @IBOutlet private weak var indicatorview: UIView!

    internal func display(indexPath: IndexPath, customCell: PunaListCell, separatorStyle: PunaSeparatorStyle) {
        setup(customCell: customCell, separatorStyle: separatorStyle)
        indicatorview.layer.cornerRadius = 1

        if customCell.isSelected {
            indicatorview.layer.backgroundColor = PunaStyleSheetManager.styleSheet.accentColor500.cgColor
            titleLbl.textColor = PunaStyleSheetManager.styleSheet.accentColor500
        } else {
            indicatorview.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        }
    }
}
