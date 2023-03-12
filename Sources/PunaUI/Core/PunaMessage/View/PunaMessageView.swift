//
//  PunaMessageView.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/15/20.
//

import Foundation
import UIKit
/**
Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaMessage
*/

internal protocol PunaMessageView: UIView {
    // expose behaviour to PunaMessage common to all Message Views
    var delegate: PunaMessageViewDelegate? { get set }
    func update(withConfig config: PunaMessageViewConfig)
}
