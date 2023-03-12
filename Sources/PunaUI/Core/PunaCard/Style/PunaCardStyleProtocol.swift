//
//  PunaCardStyleProtocol.swift
//  PunaUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation
import UIKit

internal protocol PunaCardStyleProtocol {
    var shadow: PunaCardShadowConfig? { get }
    var borderColor: UIColor? { get }
}
