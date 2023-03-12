//
//  PunaTooltipViewDelegate.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 03-03-21.
//

import Foundation
import UIKit

/**
 /// Used to route events form internal message views to PunaTooltip
 */
internal protocol PunaTooltipViewDelegate: UIView {
    func onDismissed()
}
