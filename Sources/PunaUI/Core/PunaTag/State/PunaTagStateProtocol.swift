//
//  PunaTagStateProtocol.swift
//  PunaUI
//
//  Created by Facundo Conil on 9/28/20.
//

import Foundation
import UIKit

protocol PunaTagStateProtocol {
    var textColor: UIColor { get }
    var borderColor: UIColor { get }
    var buttonColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var rightButtonImageName: String? { get }
}
