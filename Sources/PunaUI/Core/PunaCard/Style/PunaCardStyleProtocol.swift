//
//  PunaCardStyleProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

internal protocol PunaCardStyleProtocol {
    var shadow: PunaCardShadowConfig? { get }
    var borderColor: UIColor? { get }
}
