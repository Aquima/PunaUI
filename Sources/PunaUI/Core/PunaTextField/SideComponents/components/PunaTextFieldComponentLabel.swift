//
//  PunaTextFieldComponentLabel.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
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
