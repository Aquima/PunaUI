//
//  PunaCarouselFullWidthView.swift
//  PunaUI
//
//  Created by Raul Quispe on 29/03/2021.
//

import Foundation
import UIKit

class PunaCarouselFullWidthView: PunaCarouselAbstractView {

    override func setup() {
        super.setup()
        if config.usePaginator, let pageControl = self.pageControl {
            pageControl.selectedColor = .white
            pageControl.delegate = self
        }
    }
    override func getItemSize(sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }

    override func getContentInset(_ section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    override func positionPageControl() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
}

extension PunaCarouselFullWidthView: PunaScrollingPageControlDelegate {
    func viewForDot(at index: Int) -> UIView? {
        let dotView =  PunaPageDotView(frame: CGRect(origin: .zero, size: CGSize(width: 9, height: 9)))
        dotView.layer.borderWidth = 1.0

        return dotView
    }

}
