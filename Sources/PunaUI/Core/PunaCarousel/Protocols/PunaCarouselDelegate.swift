//
//  PunaCarouselDelegate.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 04/02/2021.
//

import Foundation

@objc public protocol PunaCarouselDelegate {

    @objc func PunaCarousel(_ carouselView: PunaCarousel, didSelectItemAt indexPath: IndexPath)

    @objc optional func PunaCarousel(_ carouselView: PunaCarousel, sizeForItemAt indexPath: IndexPath) -> CGSize
}
