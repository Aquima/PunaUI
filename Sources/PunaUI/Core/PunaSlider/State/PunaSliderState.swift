//
//  PunaSliderState.swift
//  PunaUI
//
//  Created by Victor Chang on 27/02/2021.
//

import Foundation

/**
PunaSliderState represent the state of the componen: {idle, disable}
*/

@objc public enum PunaSliderState: Int, PunaEnumStringConvertible {

    case idle
    case disable

    public static func keyFor(_ value: PunaSliderState) -> String {
        switch value {
            case .idle: return "IDLE"
            case .disable: return "DISABLE"
        }
    }
}
