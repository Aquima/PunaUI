//
//  PunaRadioButtonViewDelegate.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// Used to route events form internal checkbox views to PunaRadioButton
internal protocol PunaRadioButtonViewDelegate: AnyObject {
    func radioButtonTapped()
}
