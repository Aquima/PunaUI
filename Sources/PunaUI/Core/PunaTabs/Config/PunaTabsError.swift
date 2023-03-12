//
//  PunaTabsError.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public enum PunaTabsError: Int, Error, LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .tabNotFound:
            return "The selected tab does not exist"
        }
    }
    case tabNotFound
}
