//
//  PunaThumbnailIconView.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 01/07/2020.
//

import Foundation
import UIKit
class PunaThumbnailIconView: PunaThumbnailAbstractView {

	private var imageView: UIImageView!

	override func drawImage() {

		if let imageView = imageView {
			imageView.removeFromSuperview()
		}

		guard let icon = config.image, let iconColor = config.iconColor else { return }

		imageView = UIImageView(image: icon.withRenderingMode(.alwaysTemplate))
		imageView.tintColor = iconColor
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.widthAnchor.constraint(equalToConstant: config.iconSize).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: config.iconSize).isActive = true
		imageView.contentMode = .scaleAspectFit
		imageView.accessibilityIdentifier = icon.accessibilityIdentifier
		self.addSubview(imageView)
		imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
	}
}
