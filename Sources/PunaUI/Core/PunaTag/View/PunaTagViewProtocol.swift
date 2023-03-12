//
//  PunaTagViewProtocol.swift
//  PunaUI
//
//  Created by Samuel Sainz on 5/27/20.
//

import Foundation
import UIKit

internal protocol PunaTagViewProtocol: UIView {
    var delegate: PunaTagViewDelegate? { get set }
    func update(withConfig config: PunaTagViewConfig)
}
