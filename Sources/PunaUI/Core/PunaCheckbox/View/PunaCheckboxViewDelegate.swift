//
//  PunaCheckboxViewDelegate.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/15/20.
//

import Foundation

/// Used to route events form internal checkbox views to PunaCheckbox
internal protocol PunaCheckboxViewDelegate: AnyObject {
    func checkboxTapped()
}
