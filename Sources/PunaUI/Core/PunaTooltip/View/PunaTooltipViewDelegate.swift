//
//  PunaTooltipViewDelegate.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/**
 /// Used to route events form internal message views to PunaTooltip
 */
internal protocol PunaTooltipViewDelegate: UIView {
    func onDismissed()
}
