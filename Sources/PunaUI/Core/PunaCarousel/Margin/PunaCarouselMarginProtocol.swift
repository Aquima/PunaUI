//
//  PunaCarouselMarginProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation

internal protocol PunaCarouselMarginProtocol {
    var margin: CGFloat { get }
    var cellSpacing: CGFloat { get }
    var marginMode: PunaCarouselMargin { get }
}
