//
//  ViewUtils.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 13/09/2021.
//

import Foundation
import UIKit
import PureLayout

class ViewUtils {
    public static func buildSeparatorView(toSize: CGFloat, color: UIColor = UIColor.white) -> UIView {
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.backgroundColor = color
        emptyView.autoSetDimension(.height, toSize: toSize)
        return emptyView
    }
}
