//
//  
//  PunaTooltipView.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 19-01-21.
//
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
