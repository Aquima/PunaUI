//
//  PunaThumbnailImageView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaThumbnailImageView: PunaThumbnailAbstractView {

	private var imageView: UIImageView!
	private var overlayView: UIView!

	override func drawImage() {

		if let imageView = imageView {
			imageView.removeFromSuperview()
		}

		guard let image = config.image else {
			return
		}

		imageView = UIImageView(image: image)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		self.addSubview(imageView)
		imageView.pinToSuperview(top: 0, left: 0, bottom: 0, right: 0)
		imageView.accessibilityIdentifier = image.accessibilityIdentifier
		drawOverlay()
	}

	func drawOverlay() {

		if let overlayView = overlayView {
			overlayView.removeFromSuperview()
		}

		guard let overlayColor = config.overlayColor else { return }

		overlayView = UIView.init(frame: self.frame)
		overlayView.backgroundColor = overlayColor
		self.addSubview(overlayView)
	}
}
