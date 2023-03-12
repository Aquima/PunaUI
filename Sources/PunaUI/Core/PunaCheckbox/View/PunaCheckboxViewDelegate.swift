//
//  PunaCheckboxViewDelegate.swift
//  PunaUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation

/// Used to route events form internal checkbox views to PunaCheckbox
internal protocol PunaCheckboxViewDelegate: AnyObject {
    func checkboxTapped()
}
