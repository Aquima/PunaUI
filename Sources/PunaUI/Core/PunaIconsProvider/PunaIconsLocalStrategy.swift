//
//  PunaIconsLocalStrategy.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 2/19/20.
//

import Foundation
import UIKit

class PunaIconsLocalStrategy: PunaIconsStrategy {
    func loadIcon(name: String, success: (UIImage) -> Void, failure: ((Error?) -> Void)?) {
        let main = Bundle(for: PunaBundle.self)
        guard let bundlePath = main.resourceURL?.appendingPathComponent("PunaIcons.bundle"),
              let iconsBundle = Bundle(url: bundlePath),
              let icon = UIImage(named: name, in: iconsBundle, compatibleWith: nil) else {
            failure?(nil)
            return
        }

        success(icon)
    }
}
