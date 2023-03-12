//
//  PunaTextFieldCodeDelegate.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

@objc public protocol PunaTextFieldCodeDelegate: NSObjectProtocol {
    @objc optional func textDidChange(_ text: String)
    @objc optional func textDidComplete(_ isComplete: Bool)
}
