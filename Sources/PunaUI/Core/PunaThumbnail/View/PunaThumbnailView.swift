//
//  PunaThumbnailView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal protocol PunaThumbnailView: UIView {
	func update(withConfig config: PunaThumbnailViewConfig)
}
