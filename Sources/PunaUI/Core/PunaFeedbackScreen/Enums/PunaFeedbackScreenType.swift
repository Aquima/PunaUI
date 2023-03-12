//
//  PunaFeedbackScreenType.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/15/20.
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
