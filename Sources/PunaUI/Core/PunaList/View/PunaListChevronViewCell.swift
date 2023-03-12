//
//  PunaListChevronViewCell.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import UIKit

class PunaListChevronViewCell: PunaListCell {

    @IBOutlet weak var chevronImg: UIImageView!
    @IBOutlet weak var chevronWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var chevronHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var spaceChevronWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopChevronConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomChevronConstraint: NSLayoutConstraint!

    internal func display(indexPath: IndexPath, customCell: PunaListCell, separatorStyle: PunaSeparatorStyle) {
        setup(customCell: customCell, separatorStyle: separatorStyle)
        if let chevronSize = customCell.chevronSize {
            PunaIconsProvider.loadIcon(name: customCell.chevron ?? "", placeItInto: self.chevronImg)
            self.chevronWidthConstraint.constant = chevronSize
            self.chevronHeightConstraint.constant = chevronSize
            self.chevronImg.tintColor = UIColor.Puna.gray550
            self.paddingTopChevronConstraint.constant = customCell.paddingTopChevron ?? 0
            self.paddingBottomChevronConstraint.constant = customCell.paddingBottomChevron ?? 0
            self.spaceChevronWidthConstraint.constant = customCell.separatorChevronWidth ?? 0
        }
    }

}
