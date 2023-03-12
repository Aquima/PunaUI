//
//  PunaTextFieldEmptySideComponent.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 13/07/21.
//

import Foundation

class PunaTextFieldEmptySideComponent: PunaTextFieldRightComponent, PunaTextFieldLeftComponent {
    var visibility: PunaTextFieldComponentVisibility = .whenNotEmpty
    var reloadPolicy: PunaTextFieldComponentReloadPolicy = .onlyOneTime
}
