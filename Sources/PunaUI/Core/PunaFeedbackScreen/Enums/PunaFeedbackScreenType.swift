//
//  PunaFeedbackScreenType.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 17/08/2021.
//

import Foundation

enum PunaFeedbackScreenType: Int, PunaEnumStringConvertible {
    case simple
    case congrats

    public static func keyFor(_ value: PunaFeedbackScreenType) -> String {
        switch value {
        case .simple: return "SIMPLE"
        case .congrats: return "CONGRATS"
        }
    }
}
