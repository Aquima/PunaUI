//
//  PunaStringsLocalizableExtensions.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

extension String {

    /// Localize the string using itself as a key
    func localized() -> String {
        return PunaBundle.bundle().localizedString(forKey: self, value: self, table: "PunaUILocalizable")
    }

    func localizeWithFormat(arguments: CVarArg...) -> String {
        return String(format: self.localized(), arguments: arguments)
    }
}
