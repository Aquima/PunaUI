//
//  PunaMessageViewDelegate.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

/// Used to route events form internal message views to PunaMessage
internal protocol PunaMessageViewDelegate: AnyObject {
    func dismissTapped()
    func primaryBtnTouchUp()
    func secondaryBtnTouchUp()
}
