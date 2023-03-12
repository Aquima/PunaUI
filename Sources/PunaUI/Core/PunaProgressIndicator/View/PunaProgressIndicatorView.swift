//
//  
//  PunaProgressIndicatorView.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-20.
//
//

import Foundation
import UIKit

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaProgressIndicator
 */
internal protocol PunaProgressIndicatorView: UIView {
    func update(withConfig config: PunaProgressIndicatorViewConfig)
    func startAnimation(type: PunaCircularProgressBar.AnimationType)
    func stopAnimation()
}
