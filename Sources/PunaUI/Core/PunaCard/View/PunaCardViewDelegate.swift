//
//  PunaCardViewDelegate.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

/// Used to route events form internal card views to PunaCard
internal protocol PunaCardViewDelegate: AnyObject {
    func onLinkTouchUp()
    func onCardTouchUp()
}
