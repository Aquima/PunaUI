//
//  PunaMessageViewDelegate.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 1/17/20.
//

import Foundation

/// Used to route events form internal message views to PunaMessage
internal protocol PunaMessageViewDelegate: AnyObject {
    func dismissTapped()
    func primaryBtnTouchUp()
    func secondaryBtnTouchUp()
}
