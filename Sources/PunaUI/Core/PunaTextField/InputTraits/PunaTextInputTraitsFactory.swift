//
//  PunaTextInputTraitsFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal class PunaTextInputTraitsFactory: NSObject {
    static func getTraits(for type: PunaTextInputTraits) -> UITextInputTraits? {
        switch type {
        case .password:
            return PunaTextInputTraitsPassword()
        case .email:
            return PunaTextInputTraitsEmail()
        case .numberPad:
            return PunaTextInputTraitsNumberPad()
        case .custom:
            return nil
        }
    }
}

@objc internal class PunaTextInputTraitsEmail: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .emailAddress
    var textContentType: UITextContentType! = .emailAddress
}

@objc internal class PunaTextInputTraitsPassword: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .default
    var isSecureTextEntry: Bool = true
}

@objc internal class PunaTextInputTraitsNumberPad: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .numberPad
}
