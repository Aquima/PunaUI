//
//  PunaFeedbackScreenColor.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/15/20.
//

import Foundation

@objc public enum PunaFeedbackScreenColor: Int, PunaEnumStringConvertible {
    var colorType: PunaBadgeIconType {
        switch self {
        case .green: return .green
        case .orange: return .orange
        case .red: return .red
        }
    }

    var iconName: String {
        switch self {
        case .green: return PunaIcons.feedbackSuccess40
        case .orange: return PunaIcons.feedbackWarning40
        case .red: return PunaIcons.feedbackError40
        }
    }

    case green
    case orange
    case red

    public static func keyFor(_ value: PunaFeedbackScreenColor) -> String {
        switch value {
        case .green: return "POSITIVE"
        case .orange: return "CAUTION"
        case .red: return "NEGATIVE"
        }
    }
}
