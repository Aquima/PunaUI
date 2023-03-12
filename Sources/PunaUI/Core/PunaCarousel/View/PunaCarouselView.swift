//
//  PunaCarouselView.swift
//  PunaUI
//
//  Created by Raul Quispe on 29/03/2021.
//

import Foundation
import UIKit

internal protocol PunaCarouselView: UIView {
    func update(withConfig config: PunaCarouselViewConfig)
}
