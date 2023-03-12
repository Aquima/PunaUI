//
//  PunaAutosuggestFloatingMenuDirectionPolicy.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import UIKit

class PunaAutosuggestFloatingMenuLocationPolicy {

    static let minHeight: CGFloat = 100

    static internal func preferedLocation(targetView: UIView, superView: UIView, availableFrame: CGRect) -> PunaAutosuggestFloatingMenuLocation {

        let targetViewConvertedRect = superView.convert(targetView.frame, from: targetView)
        let upAvailableHeight = targetViewConvertedRect.minY - availableFrame.minY
        let bottomAvailableHeight =  availableFrame.maxY - targetViewConvertedRect.maxY

        if upAvailableHeight > bottomAvailableHeight {
            return PunaAutosuggestFloatingMenuLocation(height: upAvailableHeight, direction: .up)
        } else {
            return PunaAutosuggestFloatingMenuLocation(height: bottomAvailableHeight, direction: .down)
        }
    }
}
