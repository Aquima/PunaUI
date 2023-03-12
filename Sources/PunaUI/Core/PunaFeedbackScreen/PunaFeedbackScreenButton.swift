//
//  PunaFeedbackScreenButton.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//
import Foundation

@objc public class PunaFeedbackScreenButton: NSObject {
    let text: String
    let callback: (() -> Void)

    @objc public init(text: String, callback: @escaping () -> Void) {
        self.text = text
        self.callback = callback
    }
}
