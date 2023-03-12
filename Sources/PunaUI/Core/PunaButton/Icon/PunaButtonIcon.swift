//
//  PunaButtonIcon.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 07/01/2020.
//

import Foundation
import UIKit

/**
  Object model that contains the Button Icon representation
 */
@objc public class PunaButtonIcon: NSObject {
    @objc public private(set) var icon: UIImage
    @objc public private(set) var orientation: PunaButtonOrientation

    @objc public init(icon: UIImage, orientation: PunaButtonOrientation) {
        self.icon = icon
        self.orientation = orientation
    }
}

/**
 Represents the orientation of the icon in the Button, the icon can be at the right or left
 */
@objc public enum PunaButtonOrientation: Int, PunaEnumStringConvertible {
    case left
    case right

    public static func keyFor(_ value: PunaButtonOrientation) -> String {
        switch value {
        case .left: return "LEFT"
        case .right: return "RIGHT"
        }
    }
}
