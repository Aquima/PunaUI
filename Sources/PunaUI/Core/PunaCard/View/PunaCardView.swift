//
//  PunaCardView.swift
//  PunaUI
//
//  Created by Martin Victory on 13/07/2020.
//

import Foundation
import UIKit
/**
 Internal protocol specifying the behaviour required by views to be a valid PunaCard representation
 */

internal protocol PunaCardView: UIView {
    var delegate: PunaCardViewDelegate? { get set }
    func update(withConfig config: PunaCardViewConfig)
}
