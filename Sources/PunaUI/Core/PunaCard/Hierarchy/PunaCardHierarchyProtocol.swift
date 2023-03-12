//
//  PunaCardHierarchyProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

internal protocol PunaCardHierarchyProtocol {
    var backgroundColor: UIColor { get }
    var cardShadow: PunaCardShadowConfig? { get }
    var borderColor: UIColor? { get }
    var pipeColor: UIColor { get }
}
