//
//  PunaListSimpleViewCell.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import UIKit

class PunaListSimpleViewCell: PunaListCell {
    internal func display(indexPath: IndexPath, customCell: PunaListCell, separatorStyle: PunaSeparatorStyle) {
        setup(customCell: customCell, separatorStyle: separatorStyle)
    }
}
