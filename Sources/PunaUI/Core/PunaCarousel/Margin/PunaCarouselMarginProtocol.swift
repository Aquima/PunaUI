//
//  PunaCarouselMarginProtocol.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 08/02/2021.
//

import Foundation

internal protocol PunaCarouselMarginProtocol {
    var margin: CGFloat { get }
    var cellSpacing: CGFloat { get }
    var marginMode: PunaCarouselMargin { get }
}
