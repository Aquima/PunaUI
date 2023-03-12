//
//  PunaCarouselView.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 08/02/2021.
//

import Foundation
import UIKit

internal protocol PunaCarouselView: UIView {
    func update(withConfig config: PunaCarouselViewConfig)
}
