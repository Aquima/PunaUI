//
//  DefaultsLinearProgress.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

@objc(DefaultsLinearProgress) public class DefaultsLinearProgress: NSObject {
    @objc static public let trackTint: UIColor = UIColor.Puna.gray100
    @objc static public let indicatorTint: UIColor = UIColor.Puna.blueML500
    @objc static public let size: PunaLinearProgressIndicatorSize = .small
    @objc static public let splitSize: Int = 0
    @objc static public let cornerRadius: Int = 0
    @objc static public let allRoundedCorner: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    @objc static public let topBottomRightRoundedCorner: CACornerMask = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    @objc static public let topBottomLeftRoundedCorner: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    @objc static public let isSplit: Bool = false
    @objc static public let numberOfSteps: Int = 10
    @objc static public let minNumberOfSteps = 1
    @objc static public let maxNumberOfSteps = 20
    @objc static public let stepInitial: Int = 0
    @objc static public let stepOne: Int = 1
    @objc static public let stepTwo: Int = 2
}
