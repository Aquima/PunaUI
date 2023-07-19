//
//  ColorAssetModifier.swift
//  
//
//  Created by Raul on 19/07/23.
//

import UIKit
import SwiftUI

extension ColorAsset {
    #if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public func getColor() -> SwiftUI.Color {
      SwiftUI.Color(asset: self)
    }
    #endif
}
