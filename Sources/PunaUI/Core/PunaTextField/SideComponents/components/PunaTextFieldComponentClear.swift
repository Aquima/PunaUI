//
//  PunaTextFieldComponentClear.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import Foundation

@objc public class PunaTextFieldComponentClear: NSObject, PunaTextFieldRightComponent {
    public private(set) var visibility: PunaTextFieldComponentVisibility = .whenNotEmpty
    public private(set) var reloadPolicy: PunaTextFieldComponentReloadPolicy = .always

    let clearIcon = PunaIcons.close16
    let iconColor = PunaStyleSheetManager.styleSheet.textColorSecondary
}
