//
//  PunaTextFieldComponentReloadPolicy.swift
//  PunaUI
//
//  Created by Santiago Lazzari on 07/06/2021.
//

import Foundation

@objc public enum PunaTextFieldComponentReloadPolicy: Int, PunaEnumStringConvertible {
    case always
    case onlyOneTime

    public static func keyFor(_ value: PunaTextFieldComponentReloadPolicy) -> String {
        switch value {
        case .always: return "ALWAYS"
        case .onlyOneTime: return "ONLYONETIME"
        }
    }
}
