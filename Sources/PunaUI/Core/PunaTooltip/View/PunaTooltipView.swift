//
//  
//  PunaTooltipView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaTooltip
 */
internal protocol PunaTooltipView: UIView {
    var delegate: PunaTooltipViewDelegate? { get set }
    func update(withConfig config: PunaTooltipViewConfig)
    func show(in view: UIView, within superView: UIView, position: PunaTooltipPosition)
    func dismiss()
}
