//
//  PunaIconsStrategy.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

@objc public protocol PunaIconsStrategy {
    /// Provides an icon retrieved from Images.xcassets, if not found, calls failure with nil
    /// - Parameters:
    ///   - name: icon name
    ///   - success: called if icon found
    ///   - failure: called if icon not found or error occured
    func loadIcon(name: String, success: (UIImage) -> Void, failure: ((Error?) -> Void)?)
}
