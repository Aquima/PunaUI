//
//  PunaThumbnailTypeFactory.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 30/06/2020.
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
