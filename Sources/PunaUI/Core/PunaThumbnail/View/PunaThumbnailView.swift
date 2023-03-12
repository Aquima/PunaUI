//
//  PunaThumbnailView.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 01/07/2020.
//

import Foundation
import UIKit

internal protocol PunaThumbnailView: UIView {
	func update(withConfig config: PunaThumbnailViewConfig)
}
