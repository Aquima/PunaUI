//
//  PunaCardHierarchyProtocol.swift
//  PunaUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation
import UIKit

internal protocol PunaCardHierarchyProtocol {
    var backgroundColor: UIColor { get }
    var cardShadow: PunaCardShadowConfig? { get }
    var borderColor: UIColor? { get }
    var pipeColor: UIColor { get }
}
