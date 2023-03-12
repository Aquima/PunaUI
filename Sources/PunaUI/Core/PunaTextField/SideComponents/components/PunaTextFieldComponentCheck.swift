//
//  PunaTextFieldComponentCheck.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public class PunaTextFieldComponentCheck: NSObject, PunaTextFieldRightComponent {
    public private(set) var visibility: PunaTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: PunaTextFieldComponentReloadPolicy = .always

    @objc public private(set) var icon: UIImage = UIImage()
    @objc public private(set) var tintColor: UIColor = PunaStyleSheetManager.styleSheet.feedbackColorPositive

    public override init() {
        super.init()
        PunaIconsProvider.loadIcon(name: PunaIcons.feedbackSuccess16) { self.icon = $0 }
    }
}
