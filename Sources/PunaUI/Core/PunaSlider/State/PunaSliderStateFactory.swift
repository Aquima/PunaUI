//
//  PunaSliderStateFactory.swift
//  PunaUI
//
//  Created by Victor Chang on 27/02/2021.
//

import Foundation

/**
The responsability of the factory is to provide the right State by providing the PunaSliderState
*/

class PunaSliderStateFactory {
	static func provideState(key: PunaSliderState) -> PunaSliderStateProtocol {
		switch key {
			case .idle:
				return PunaSliderStateIdle()
			case .disable:
				return PunaSliderStateDisable()
		}
	}
}
