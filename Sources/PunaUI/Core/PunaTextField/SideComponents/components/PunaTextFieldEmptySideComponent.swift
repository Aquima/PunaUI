//
//  PunaTextFieldEmptySideComponent.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaTextFieldEmptySideComponent: PunaTextFieldRightComponent, PunaTextFieldLeftComponent {
    var visibility: PunaTextFieldComponentVisibility = .whenNotEmpty
    var reloadPolicy: PunaTextFieldComponentReloadPolicy = .onlyOneTime
}
