//
//  PunaFeedbackScreenButton.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 13/09/2021.
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
