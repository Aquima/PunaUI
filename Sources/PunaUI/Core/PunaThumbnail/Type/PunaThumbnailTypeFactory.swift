//
//  PunaThumbnailTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaThumbnailTypeFactory {
    static func provide(_ type: PunaThumbnailType, accentColor: UIColor?, borderColor: UIColor?) -> PunaThumbnailTypeProtocol {
		switch type {
		case .icon:
			return PunaThumbnailTypeIcon(accentColor: accentColor)
		case .imageCircle:
			return PunaThumbnailTypeImageCircle()
		case .imageSquare:
			return PunaThumbnailTypeImageSquare()
		}
	}
}
