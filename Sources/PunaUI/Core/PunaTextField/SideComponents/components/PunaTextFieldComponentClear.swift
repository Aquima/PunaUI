//
//  PunaTextFieldComponentClear.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public class PunaTextFieldComponentClear: NSObject, PunaTextFieldRightComponent {
    public private(set) var visibility: PunaTextFieldComponentVisibility = .whenNotEmpty
    public private(set) var reloadPolicy: PunaTextFieldComponentReloadPolicy = .always

    let clearIcon = PunaIcons.close16
    let iconColor = PunaStyleSheetManager.styleSheet.textColorSecondary
}
