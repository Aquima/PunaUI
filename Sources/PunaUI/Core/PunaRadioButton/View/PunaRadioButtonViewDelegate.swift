//
//  PunaRadioButtonViewDelegate.swift
//  PunaUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation

/// Used to route events form internal checkbox views to PunaRadioButton
internal protocol PunaRadioButtonViewDelegate: AnyObject {
    func radioButtonTapped()
}
