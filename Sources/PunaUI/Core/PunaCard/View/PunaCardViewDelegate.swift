//
//  PunaCardViewDelegate.swift
//  PunaUI
//
//  Created by Martin Victory on 15/07/2020.
//

import Foundation

/// Used to route events form internal card views to PunaCard
internal protocol PunaCardViewDelegate: AnyObject {
    func onLinkTouchUp()
    func onCardTouchUp()
}
