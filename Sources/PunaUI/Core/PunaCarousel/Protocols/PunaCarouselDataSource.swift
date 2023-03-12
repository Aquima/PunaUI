//
//  PunaCarouselDataSource.swift
//  PunaUI
//
//  Created by Raul Quispe on 29/03/2021.
//

import Foundation
import UIKit

@objc public protocol PunaCarouselDataSource {

    @objc func PunaCarousel(_ carouselView: PunaCarousel, cellForRowAt indexPath: IndexPath) -> UIView
    @objc func getDataSetSize(_ carouselView: PunaCarousel) -> Int
}
