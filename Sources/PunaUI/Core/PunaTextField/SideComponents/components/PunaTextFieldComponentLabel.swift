//
//  PunaTextFieldComponentLabel.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public class PunaTextFieldComponentLabel: NSObject, PunaTextFieldLeftComponent, PunaTextFieldRightComponent {
    public private(set) var visibility: PunaTextFieldComponentVisibility = .always
    public private(set) var reloadPolicy: PunaTextFieldComponentReloadPolicy = .always

    @objc public let text: String
    public internal(set) var style: PunaFontStyle = PunaTextFieldViewConfig.getInputTextStyle(PunaStyleSheetManager.styleSheet.textColorSecondary)

    @objc public init(text: String) {
        self.text = text
        super.init()
    }
}
