//
//  PunaCarouselDefaultWidthView.swift
//  PunaUI
//
//  Created by Raul Quispe on 29/03/2021.
//

import Foundation
import UIKit

class PunaCarouselDefaultWidthView: PunaCarouselAbstractView {

    override func getItemSize(sizeForItemAt indexPath: IndexPath) -> CGSize {
        return PunaCarouselTypeCardViewConfigFactory.getItemSize(with: self.collectionView, config: self.config, indexPath: indexPath)
    }

    override func getContentInset(_ section: Int) -> UIEdgeInsets {
        return PunaCarouselTypeCardViewConfigFactory.getContentInset(with: self.config)
    }

    override func positionPageControl() {

        pageControl.translatesAutoresizingMaskIntoConstraints = false

        if let titleLabel = self.titleLabel {
            let titleBaseLine = titleLabel.font.ascender
            let topMargin =  titleBaseLine - pageControl.getDotSize()
            pageControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.config.margin).isActive = true
            pageControl.topAnchor.constraint(equalTo: self.topAnchor, constant: topMargin).isActive = true

            let pageControlSize = pageControl.intrinsicContentSize
            if let titleLabelRigthConstraint = titleLabelRigthConstraint, pageControlSize.width > 0 {
                let rigthMargin = pageControlSize.width + self.config.margin
                titleLabelRigthConstraint.isActive = false
                titleLabelRigthConstraint.constant = -rigthMargin
                titleLabelRigthConstraint.isActive = true
                titleLabel.sizeToFit()
            }
        } else {
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        }
    }

    override func applyShadowContetView(cell: UICollectionViewCell) {
        let shadowColor = UIColor.black.cgColor
        let shadowOffset = CGSize(width: 5.0, height: 5.0)
        let shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath

        cell.layer.applyShadow(with: 3.0,
                               shadowOpacity: 0.3,
                               isMaskToBounds: false,
                               shadowOffSet: shadowOffset,
                               shadowColor: shadowColor,
                               shadowPath: shadowPath)
    }
}
