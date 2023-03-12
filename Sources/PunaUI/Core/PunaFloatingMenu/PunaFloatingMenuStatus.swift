//
//  PunaFloatingMenuStatus.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 27/07/2021.
//

import Foundation

typealias OpenPosition = (typeVertical: PunaFloatingOpenTypeVertical, typeHorizontal: PunaFloatingOpenTypeHorizontal)

enum PunaFloatingMenuStatus: Equatable {
    static func == (lhs: PunaFloatingMenuStatus, rhs: PunaFloatingMenuStatus) -> Bool {
        switch (lhs, rhs) {
        case (.closed, .closed):
            return true
        case (.open(let lhsValue), .open(let rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
    case open(openPosition: OpenPosition)
    case closed
}
