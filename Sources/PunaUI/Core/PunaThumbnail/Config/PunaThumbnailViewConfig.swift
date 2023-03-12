//
//  PunaThumbnailViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit
/**
The PunaThumbnailViewConfig contains the differents customizable attributes of the view
*/
internal struct PunaThumbnailViewConfig {

	var image: UIImage!
	var size: CGFloat = 24
	var iconSize: CGFloat = 0.0
	var cornerRadius: CGFloat = 3.0
	var borderColor: UIColor?
	var overlayColor: UIColor?
	var backgroundColor: UIColor = .white
	var iconColor: UIColor?
	var outlineColor: UIColor?
	var outlineWidth: CGFloat?
	var badgeView: UIView?
}
