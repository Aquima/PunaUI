//
//  
//  PunaProgressIndicatorView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
