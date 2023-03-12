//
//  
//  PunaRadioButtonGroupView.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 10/06/21.
//
//

import Foundation
import UIKit

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaRadioButtonGroup
 */
internal protocol PunaRadioButtonGroupView: UIView {
    func update(withConfig config: PunaRadioButtonGroupViewConfig)
}
