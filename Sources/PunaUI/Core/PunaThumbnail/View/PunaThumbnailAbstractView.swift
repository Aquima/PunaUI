//
//  PunaThumbnailAbstractView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal class PunaThumbnailAbstractView: UIView, PunaThumbnailView {

	var config: PunaThumbnailViewConfig
	private var fallbackImageView: UIImageView!

	required init?(coder: NSCoder) {
		config = PunaThumbnailViewConfig()
		super.init(coder: coder)
		setup()
	}

	init(config: PunaThumbnailViewConfig) {
		self.config = config
		super.init(frame: .zero)
		setup()
	}

	func setup() {
		self.frame = CGRect(x: 0, y: 0, width: config.size, height: config.size)
		backgroundColor = config.backgroundColor
		self.clipsToBounds = true
		thumbnailShape()
		drawImage()
	}

	func update(withConfig config: PunaThumbnailViewConfig) {
		self.config = config
		setup()
	}

	func thumbnailShape() {
		self.layer.cornerRadius = config.cornerRadius
		guard let borderColor = config.borderColor else {
			self.layer.borderWidth = 0.0
			return
		}
		self.layer.borderColor = borderColor.cgColor
		self.layer.borderWidth = 1.0

	}

	func drawImage() {
		fatalError("This should be overriden by a subclass")
	}
}
