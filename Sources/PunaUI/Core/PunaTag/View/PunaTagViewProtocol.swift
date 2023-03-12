//
//  PunaTagViewProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal protocol PunaTagViewProtocol: UIView {
    var delegate: PunaTagViewDelegate? { get set }
    func update(withConfig config: PunaTagViewConfig)
}
