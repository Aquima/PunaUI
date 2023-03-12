//
//  PunaListSimpleViewCell.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import UIKit

class PunaListSimpleViewCell: PunaListCell {
    internal func display(indexPath: IndexPath, customCell: PunaListCell, separatorStyle: PunaSeparatorStyle) {
        setup(customCell: customCell, separatorStyle: separatorStyle)
    }
}
